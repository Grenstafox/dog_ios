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
        ScrollView{
            Text("\(controlador.personaje?.name ?? "Valor por defecto")")
                .font(Font.custom("Saiyan-Sans Left Oblique", size: 50))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding()
                .shadow(color: Color.yellow, radius: 0, x: 5, y:5)
                
            
            AsyncImage(url: URL(string: "\(controlador.personaje?.image ?? "Valor por defecto")")){ image in
                image
                    .image?.resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 300)
            }.shadow(color: Color.yellow, radius: 0, x: 5, y:5)
            
            ZStack{
                Rectangle()
                    .foregroundColor(Color.white)
                    .cornerRadius(40)
                    .shadow(color: Color.yellow, radius: 0, x: 5, y:5)
                
                VStack{

                    Text("Raza: \(controlador.personaje?.breed ?? "Valor por defecto")")
                    Text("Género: \(controlador.personaje?.gender ?? "Valor por defecto")")
                }.padding()
                
            }.padding()
        }.background(Color.orange)
    }
}

#Preview {
    PersonajeVista()
        .environment(ControladorAplicacion())
}
