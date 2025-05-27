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
                    // Header
                    Text(perro.name)
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2, x: 2, y: 2)
                        .padding(.top)
                    
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
                gradient: Gradient(colors: [Color.orange, Color.yellow]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        )
    }
}

// Componente reutilizable
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

// Preview con datos mockeados
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

// Preview sin datos para probar el estado vacío
#Preview {
    PersonajeVista()
        .environment(ControladorAplicacion())
}
