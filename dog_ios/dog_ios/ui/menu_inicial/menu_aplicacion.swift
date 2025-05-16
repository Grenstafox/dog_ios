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
        TabView{
            
            GeneralPublicaciones()
                .tabItem{Label("En esta pantalla \n otra parte", systemImage: "circle")}
                .badge(controlador.publicaciones.count)
            
            PantallaPersonajes()
                .tabItem{
                    Label{
                        VStack{
                            Text("Dragon Ball DB")
                        }
                    } icon: {
                        Circle()
                        //.fill(person.profileColor)
                            .frame(width: 100, height: 100, alignment: .center)
                            .overlay(Text("JJ Abraham"))
                    }
                }
            
            Text("Hola desde pantalla 3")
                .tabItem{ Label("Etiqueta de esta label", systemImage: "circle")}
        }
    }
}

#Preview {
    MenuNavegacion()
        .environment(ControladorAplicacion())
}
