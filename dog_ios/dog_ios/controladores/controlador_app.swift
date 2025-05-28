//
//  controlador_app.swift
//  bocetos_IOS
//
//  Created by alumno on 4/9/25.
//

import SwiftUI

@Observable
@MainActor
public class ControladorAplicacion {
    var publicaciones: [Publicacion] = []
    var comentarios: [Comentario] = []
    var publicacion_seleccionada: Publicacion? = nil
    var perfil_a_mostrar: Perfil? = nil
    
    var pagina_resultados: PaginaResultado? = nil
    var Perros: Perrito? = nil
    
    init() {
        Task.detached(priority: .high) {
            await self.descargar_publicaciones()
            await self.descargar_perros()
        }
    }
    
    func descargar_perros() async {
        guard let razas = await DogAPI().descargar_razas() else { return }
        
        var perros: [Perrito] = []
        for raza in razas.prefix(10) { // Limita a 10 razas para ejemplo
            if let imagenUrl = await DogAPI().descargar_imagen_aleatoria(raza: raza) {
                perros.append(Perrito(imageUrl: imagenUrl, breed: raza))
            }
        }
        
        self.pagina_resultados = PaginaResultado(
            items: perros,
            meta: Meta(
                totalItems: razas.count,
                itemCount: perros.count,
                itemsPerPage: 10,
                totalPages: Int(ceil(Double(razas.count)/10)),
                currentPage: 1
            ),
            links: Enlaces(first: "", previous: "", next: "", last: "")
        )
    }
    
    func descargar_info_perro(breed: String) async { // Cambiado de id: Int a breed: String
        guard let imagenUrl = await DogAPI().descargar_imagen_aleatoria(raza: breed) else { return }
        self.Perros = Perrito(imageUrl: imagenUrl, breed: breed)
    }
    
    func descargar_informacion_perro(breed: String) { // Adaptado
        Task.detached {
            await self.descargar_info_perro(breed: breed)
        }
    }
    
    func descargar_publicaciones() async {
        defer { print("Función completada: \(#function)") }
    }
    
    func descargar_comentarios() async {
        defer { print("Función completada: \(#function)") }
    }
    
    func seleccionar_publicacion(_ publicacion: Publicacion) {
        publicacion_seleccionada = publicacion
        Task.detached { await self.descargar_comentarios() }
    }
    
    func descargar_perfil(id: Int) async {
        guard let perfil = try? await PlaceHolderAPI().descargar_perfil(id: id) else { return }
        perfil_a_mostrar = perfil
    }
    
    func ver_perfil(id: Int) {
        Task.detached { await self.descargar_perfil(id: id) }
    }
}


/*
@Observable
@MainActor
public class ContorladorGlobal{
    var publicaciones: Array<Publicacion> = []
    
    init(){
        Task.detached(priority: .high){
            /*
              do{
                  try await self.iniciar()
              }
              catch{
                  // log.error(error)
              }
              //await self.cargar_vestidos_y_maniqui()
             */
            await self.iniciar()
          }
      }
    
    func iniciar() async {
        guard let publicaciones_descargadas: [Publicacion] = try? await PlaceHolderAPI().descargar_publicaciones() else { return }
        
        publicaciones = publicaciones_descargadas
        
        
        defer{
            print("Se ha fianlziado la carga de informacion")
        }
    }
}
*/
