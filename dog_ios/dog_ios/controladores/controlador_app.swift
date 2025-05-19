//
//  controlador_app.swift
//  bocetos_IOS
//
//  Created by alumno on 4/9/25.
//

import SwiftUI

@Observable
@MainActor
public class ControladorAplicacion{
    var publicaciones: Array<Publicacion> = []
    var comentarios: Array<Comentario> = []
    
    var publicacion_seleccionada: Publicacion? = nil
    var perfil_a_mostrar: Perfil? = nil
    // Seccion Dragon Ball
    var pagina_resultados: PaginaResultado? = nil
    var personaje: MonoChino? = nil
    
    
    init(){
        Task.detached(priority: .high){
            await self.descargar_publicaciones()
            
            await self.descargar_monos_chinos()
        }
    }
    
    func descargar_monos_chinos() async {
        guard let pagina_descargada: PaginaResultado = try? await DragonBallAPI().descargar_pagina_personajes() else { return }
        
        self.pagina_resultados = pagina_descargada
    }
    
    func descargar_info_personaje(id: Int) async {
        guard let mono_chino: MonoChino = try? await DragonBallAPI().descargar_informacion_personaje(id: id) else { return }
        
        self.personaje = mono_chino
    }
    
    func descargar_informacion_personaje(id: Int){
        Task.detached(operation: {
            await self.descargar_info_personaje(id: id)
        })
    }
    
    func descargar_publicaciones() async {
        defer{
            print("Esta funcion se mando a llamar despues de todos los awaits en mi funcion \(#function)")
        }
        
        guard let publicaciones_descargadas: [Publicacion] = try? await PlaceHolderAPI().descargar_publicaciones() else { return }
        
        publicaciones = publicaciones_descargadas
    }
    
    func descargar_comentarios() async {
        defer{
            print("Esta funcion se mando a llamar despues de todos los awaits en mi funcion \(#function)")
        }
        
        guard let comentarios_descargados: [Comentario] = try? await PlaceHolderAPI().descargar_comentarios(post_id: self._publicacion_seleccionada!.id) else { return }
        
        comentarios = comentarios_descargados
    }
    
    func seleccionar_publicacion(_ publicacion: Publicacion) -> Void {
        publicacion_seleccionada = publicacion
        
        Task.detached(operation: {
            await self.descargar_comentarios()
        })
    }
    
    func descargar_perfil(id: Int) async -> Void {
        guard let perfil: Perfil = try? await PlaceHolderAPI().descargar_perfil(id: id) else { return }
        perfil_a_mostrar = perfil
    }
    
    func ver_perfil(id: Int) -> Void{
        Task.detached{
            await self.descargar_perfil(id: id)
        }
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
