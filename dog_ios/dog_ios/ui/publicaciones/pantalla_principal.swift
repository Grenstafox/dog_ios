//
//  publicaciones_generales.swift
//  dog_ios
//
//  Created by alumno on 5/27/25.
//
import SwiftUI

struct GeneralPublicaciones: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Fondo con gradiente azul
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
                
                VStack {
                    // Encabezado con título
                    VStack(spacing: 10) {
                        Text("DOGAPI")
                            .font(.system(size: 50, weight: .bold))
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                        
                        // Imagen del perro (SF Symbol)
                        Image(systemName: "dog.fill")
                            .font(.system(size: 80))
                            .foregroundColor(.white)
                            .padding(.top, 20)
                    }
                    .padding(.top, 50)
                    
                    Spacer()
                    
                    // Mensaje de bienvenida
                    Text("Bienvenido a nuestra comunidad")
                        .font(.title2)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(Color.black.opacity(0.3))
                        .cornerRadius(15)
                    
                    Spacer()
                    
                    // Botón de acción modificado
                    NavigationLink(destination: PublicacionVista()) {  // ← Cambiado a PublicacionesListView
                        Text("VISITAR")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.1, green: 0.3, blue: 0.7))
                            .frame(width: 200, height: 50)
                            .background(Color.white)
                            .cornerRadius(25)
                            .shadow(radius: 10)
                    }
                    .padding(.bottom, 50)
                }
                .padding()
            }
        }
    }
}

#Preview {
    GeneralPublicaciones()
        .environment(ControladorAplicacion())
}
