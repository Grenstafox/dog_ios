//
//  publicacion.swift
//  bocetos_IOS
//
//  Created by alumno on 4/7/25.
//

import SwiftUI

// Componente para botones de diferentes categorías
struct CategoryButton: View {
    let imageName: String
    let title: String
    let color: Color
    @State private var isPressed = false
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding(.leading, 10)
            
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.white)
                .padding(.trailing, 10)
        }
        .frame(height: 70)
        .background(color.opacity(0.8))
        .cornerRadius(10)
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .animation(.spring(response: 0.3, dampingFraction: 0.5), value: isPressed)
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in isPressed = true }
                .onEnded { _ in isPressed = false }
        )
        .shadow(color: color.opacity(0.3), radius: 5, x: 0, y: 3)
    }
}

// Estilo de animación para botones
struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct PublicacionVista: View {
    @Environment(ControladorAplicacion.self) var controlador
    @State private var selectedImageIndex = 0
    private let dogImages = ["Golden", "puff_dogs", "pastor"] // Nombres de tus imágenes en Assets
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Título
                Text(controlador.publicacion_seleccionada?.title ?? "Publicación")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundColor(Color.white)
                    .padding(.top, 20)
                
                // Slider de imágenes (y botón a ListaPerros)
                NavigationLink(destination: PantallaPersonajes()) {
                    TabView(selection: $selectedImageIndex) {
                        ForEach(0..<dogImages.count, id: \.self) { index in
                            Image(dogImages[index])
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                .cornerRadius(15)
                                .shadow(radius: 5)
                                .tag(index)
                        }
                    }
                    .tabViewStyle(.page)
                    .frame(height: 250)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.white.opacity(2))
                            .shadow(color: .black.opacity(0.2), radius: 5, x:0, y:3))
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.green, lineWidth: 3)
                    )
                    .padding(.horizontal)
                }
                .buttonStyle(ScaleButtonStyle()) // Aplicamos animación personalizada
                
                // Cuadro de texto descriptivo
                Text("Nuestro Catalogo Personalizado")
                    .font(.system(.title2, design: .serif))
                    .italic()
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.orange, Color.yellow]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                // Botones con imágenes de categorías
                VStack(spacing: 15) {
                    Text("Explora nuestra categoría:")
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                        .foregroundColor(Color.white)
                    Spacer()
                    // Botón 1 - Alimentos
                    NavigationLink(destination: PantallaPersonajes()) {
                        CategoryButton(
                            imageName: "dogfood",
                            title: "Alimentos Premium",
                            color: .green
                        )
                    }
                    
                    // Botón 2 - Juguetes
                    NavigationLink(destination: PantallaPersonajes()) {
                        CategoryButton(
                            imageName: "dogtoy",
                            title: "Juguetes Divertidos",
                            color: .blue
                        )
                    }
                    
                    // Botón 3 - Accesorios
                    NavigationLink(destination: PantallaPersonajes()) {
                        CategoryButton(
                            imageName: "dogcollar",
                            title: "Accesorios Elegantes",
                            color: .purple
                        )
                    }
                }
                .padding()
                
                // Contenido de la publicación
                if let publicacion = controlador.publicacion_seleccionada {
                    Text(publicacion.body)
                        .font(.body)
                        .padding()
                }
            }
            .padding(.bottom)
        }
        .background(
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
                }
            )
    }
}
#Preview {
    NavigationStack {
        PublicacionVista()
            .environment(ControladorAplicacion())
    }
}
