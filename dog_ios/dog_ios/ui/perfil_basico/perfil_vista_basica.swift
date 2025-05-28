//
//  perfil_vista_basica.swift
//  bocetos_IOS
//
//  Created by alumno on 4/7/25.
//

import SwiftUI
import PhotosUI

struct PerfilBasicoVista: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    // Estados para manejar imágenes
    @State private var fotoSeleccionada: PhotosPickerItem? = nil
    @State private var fotoAMostrar: UIImage? = UIImage(named: "avatar")
    @State private var mostrarSelectorPerros = false
    
    // Imágenes de perros disponibles en assets
    private let imagenesPerros = ["Golden", "puff_dogs", "pastor", "avatar"]
    
    var body: some View {
        VStack(spacing: 20) {
            // Título con gradiente
            Text("Selecciona tu imagen")
                .font(.system(size: 28, weight: .bold))
                .foregroundStyle(
                    LinearGradient(
                        colors: [Color.blue, Color.purple],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 30)
            
            // Contenedor de la imagen de perfil
            ZStack {
                // Imagen actual (de galería o assets)
                if let fotoAMostrar {
                    Image(uiImage: fotoAMostrar)
                        .resizable()
                        .scaledToFill()
                } else {
                    Image("avatar")
                        .resizable()
                        .scaledToFill()
                }
            }
            .frame(width: 300, height: 200)
            .clipShape(Circle())
            .overlay(Circle().stroke(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 4))
            .shadow(radius: 10)
            .padding(.vertical)
            
            // Botones de selección
            HStack(spacing: 20) {
                // Botón para seleccionar de galería
                PhotosPicker(selection: $fotoSeleccionada, matching: .images) {
                    Label("Galería", systemImage: "photo")
                        .frame(width: 120)
                }
                .buttonStyle(.borderedProminent)
                .tint(.blue)
                
                // Botón para seleccionar de assets
                Button {
                    mostrarSelectorPerros.toggle()
                } label: {
                    Label("Perros", systemImage: "pawprint")
                        .frame(width: 120)
                }
                .buttonStyle(.borderedProminent)
                .tint(.purple)
            }
            .padding(.bottom, 20)
            
            // Información del usuario con diseño mejorado
            VStack(alignment: .leading, spacing: 12) {
                Text("Usuario: \(controlador.perfil_a_mostrar?.username ?? "Invitado")")
                Text("Nombre: \(controlador.perfil_a_mostrar?.name ?? "No especificado")")
                Text("Email: \(controlador.perfil_a_mostrar?.email ?? "Sin email")")
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.gray.opacity(0.2))
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 3)
            )
            .padding(.horizontal)
            
            Spacer()
        }
        .onChange(of: fotoSeleccionada) { _, _ in
            Task {
                if let fotoSeleccionada,
                   let data = try? await fotoSeleccionada.loadTransferable(type: Data.self),
                   let image = UIImage(data: data) {
                    fotoAMostrar = image
                }
            }
        }
        .sheet(isPresented: $mostrarSelectorPerros) {
            VStack {
                Text("Selecciona un perro")
                    .font(.headline)
                    .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(imagenesPerros, id: \.self) { imagen in
                            Button {
                                fotoAMostrar = UIImage(named: imagen)
                                mostrarSelectorPerros = false
                            } label: {
                                Image(imagen)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.blue, lineWidth: 2)
                                    )
                            }
                        }
                    }
                    .padding()
                }
            }
            .presentationDetents([.height(200)])
        }
    }
}

// Vista de previsualización
#Preview {
    PerfilBasicoVista()
        .environment(ControladorAplicacion())
}
