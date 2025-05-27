//
//  emnu_aplicacion.swift
//  bocetos_IOS
//
//  Created by alumno on 4/7/25.
//


import SwiftUI

struct MenuNavegacion: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        TabView {
            GeneralPublicaciones()
                .tabItem {
                    Label("Publicaciones", systemImage: "list.bullet")
                }
                .badge(controlador.publicaciones.count)
            
            PantallaPersonajes()
                .tabItem {
                    Label("Perritos", systemImage: "pawprint.fill")  // Icono cambiado
                }
            
            Text("Perfil")
                .tabItem {
                    Label("Perfil", systemImage: "person.crop.circle")
                }
        }
    }
}
#Preview {
    MenuNavegacion()
        .environment(ControladorAplicacion())
}
