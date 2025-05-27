//
//  PantallaPersonajes.swift
//  bocetos_IOS
//
//  Created by alumno on 4/7/25.
//

import SwiftUI
import Foundation

struct PantallaPersonajes: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        if let pagina = controlador.pagina_resultados {
            NavigationStack {
                ScrollView {
                    LazyVStack {
                        ForEach(pagina.items) { perro in
                            NavigationLink {
                                PersonajeVista()
                            } label: {
                                HStack {
                                    AsyncImage(url: URL(string: perro.imageUrl)) { phase in
                                        phase.image?
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 250)
                                    }
                                    .background(Color.white.cornerRadius(30).shadow(color: .yellow, radius: 0, x: 5, y: 5))
                                    .padding()
                                    
                                    VStack {
                                        Text(perro.breed)  // Mostrar raza real
                                            .font(.title)
                                            .fontWeight(.bold)
                                        
                                        Divider()
                                        
                                        Text(perro.name)
                                        Text(perro.ancester)
                                    }
                                    .padding()
                                    .background(Color.white.cornerRadius(30).shadow(color: .yellow, radius: 0, x: 5, y: 5))
                                }
                                .padding()
                            }
                            .simultaneousGesture(TapGesture().onEnded {
                                controlador.descargar_informacion_perro(breed: perro.breed)  // Cambiado a breed
                            })
                        }
                    }
                }
                .background(Color.orange)
            }
        } else {
            ProgressView("Cargando perritos...")
        }
    }
}
#Preview {
    PantallaPersonajes()
        .environment(ControladorAplicacion())
}
