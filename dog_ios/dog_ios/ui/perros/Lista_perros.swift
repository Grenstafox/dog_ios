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
    
    // Acceder al tamaño de pantalla
    let screen = UIScreen.main.bounds

    var body: some View {
        if let pagina = controlador.pagina_resultados {
            NavigationStack {
                ZStack {
                    Color.orange
                        .ignoresSafeArea()
                    
                    VStack {
                        Text("Perritos disponibles")
                            .font(.largeTitle)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.top)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(pagina.items) { perro in
                                    NavigationLink {
                                        PersonajeVista()
                                    } label: {
                                        VStack(spacing: 16) {
                                            // Imagen del perro
                                            AsyncImage(url: URL(string: perro.imageUrl)) { phase in
                                                switch phase {
                                                case .success(let image):
                                                    image
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: screen.width * 0.8, height: screen.height * 0.4)
                                                        .clipped()
                                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                                default:
                                                    Rectangle()
                                                        .fill(Color.gray.opacity(0.3))
                                                        .frame(width: screen.width * 0.8, height: screen.height * 0.4)
                                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                                }
                                            }

                                            // Información del perro
                                            VStack(spacing: 6) {
                                                Text(perro.name)
                                                    .font(.title2)
                                                    .fontWeight(.semibold)
                                                    .foregroundColor(.primary)
                                                
                                                Text(perro.breed)
                                                    .font(.subheadline)
                                                    .foregroundColor(.secondary)
                                                
                                                if !perro.ancester.isEmpty {
                                                    Text("Ancestro: \(perro.ancester)")
                                                        .font(.caption)
                                                        .foregroundColor(.secondary)
                                                }
                                            }
                                            .padding(.bottom)
                                        }
                                        .frame(width: screen.width * 0.85, height: screen.height * 0.6)
                                        .background(
                                            RoundedRectangle(cornerRadius: 24)
                                                .fill(Color.white)
                                                .shadow(color: .gray.opacity(0.3), radius: 8, x: 0, y: 6)
                                        )
                                    }
                                    .simultaneousGesture(TapGesture().onEnded {
                                        controlador.descargar_informacion_perro(breed: perro.breed)
                                    })
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                        Spacer()
                    }
                    .padding(.vertical, 20)
                }
                .navigationTitle("")
                .navigationBarHidden(true)
            }
        } else {
            ProgressView("Cargando perritos...")
                .progressViewStyle(CircularProgressViewStyle(tint: .orange))
                .scaleEffect(1.5)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    PantallaPersonajes()
        .environment(ControladorAplicacion())
}

