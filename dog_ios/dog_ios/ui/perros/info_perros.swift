//
//  personaje_vista.swift
//  redes_sociales
//
//  Created by alumno on 4/7/25.
//

import SwiftUI

struct PersonajeVista: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        ScrollView {
            if let perro = controlador.personaje {
                VStack(spacing: 20) {
                    ZStack{
                        Rectangle()
                        // Header con un diseño mas bonito
                        Text(perro.breed)
                            .font(.system(size: 35, weight: .bold))
                            .foregroundStyle(
                                LinearGradient(gradient: Gradient(colors: [Color.white ,Color.white, Color.white]),
                                               startPoint: .top,
                                               endPoint: .bottom
                                    )
                                )
                            .shadow(color: .black, radius: 2, x: 2, y: 2)
                            .padding(.top)
                    }
                    // Imagen con mejor manejo de estados
                    AsyncImage(url: URL(string: perro.imageUrl)) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 300, maxHeight: 300)
                                .cornerRadius(15)
                                .shadow(color: .yellow, radius: 10, x: 0, y: 5)
                        case .failure:
                            Image(systemName: "pawprint.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                                .foregroundColor(.white)
                        default:
                            ProgressView()
                        }
                    }
                    
                    // Info Box
                    VStack(spacing: 10) {
                        InfoRow(label: "Raza", value: perro.breed)
                        InfoRow(label: "Género", value: perro.gender)
                        InfoRow(label: "Origen", value: perro.ancester)
                        InfoRow(label: "Descripción", value: perro.description)
                    }
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(15)
                    .padding(.horizontal)
                }
            } else {
                ContentUnavailableView(
                    "No hay perro seleccionado",
                    systemImage: "pawprint",
                    description: Text("Selecciona un perro de la lista")
                )
            }
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.1, green: 0.3, blue: 0.7),  // Azul oscuro
                    Color(red: 0.3, green: 0.5, blue: 0.9),  // Azul medio
                    Color(red: 0.5, green: 0.7, blue: 1.0)   // Azul claro
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        )
    }
}

// Struct para la informacion del perro y cualquier dato
struct InfoRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label + ":")
                .fontWeight(.bold)
                .foregroundColor(.yellow)
            Text(value)
                .foregroundColor(.white)
            Spacer()
        }
    }
}

// Preview con datos del perro con imagenes y breed de donde sale
#Preview {
    let controlador = ControladorAplicacion()
    // Mock de datos para el preview
    controlador.personaje = Perrito(
        imageUrl: "https://images.dog.ceo/breeds/labrador/n02099712_741.jpg",
        breed: "Labrador Retriever"
    )
    
    return PersonajeVista()
        .environment(controlador)
}

// Preview que ayuda a visualizar los datos de la pantalla
#Preview {
    PersonajeVista()
        .environment(ControladorAplicacion())
}
