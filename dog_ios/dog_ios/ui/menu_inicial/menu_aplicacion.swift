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
                    Label("Inicio", systemImage: "house.fill")
                }            
            PantallaPersonajes()
                .tabItem {
                    Label("Perritos", systemImage: "pawprint.fill")  // Icono cambiado
                }
            
            PerfilBasicoVista()
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
