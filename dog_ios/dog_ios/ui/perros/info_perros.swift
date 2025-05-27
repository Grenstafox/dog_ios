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
                VStack {
                    Text(perro.name)
                        .fontWeight(.bold)
                        .padding()
                        .shadow(color: .yellow, radius: 0, x: 5, y: 5)
                    
                    AsyncImage(url: URL(string: perro.imageUrl)) { phase in
                        phase.image?
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 300)
                    }
                    .shadow(color: .yellow, radius: 0, x: 5, y: 5)
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.black)
                            .cornerRadius(40)
                            .shadow(color: .yellow, radius: 0, x: 5, y: 5)
                        
                        VStack {
                            Text("Raza: \(perro.breed)")
                            Text("Género: \(perro.gender)")
                        }
                        .padding()
                    }
                    .padding()
                }
            }
        }
        .background(Color.orange)
    }
}
#Preview {
    PersonajeVista()
        .environment(ControladorAplicacion())
}
