//
//  ContentView.swift
//  bocetos_IOS
//
//  Created by alumno on 4/7/25.
//

import SwiftUI

import PhotosUI

struct ContentView: View {
    @State var foto_seleccionada:
        PhotosPickerItem? = nil
    @State var foto_a_mostrar: UIImage? = nil
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.yellow)
                .cornerRadius(40)
                .frame(width: 400, height: 100)
            Text("Hola a APIDOG")
                .font(Font.custom("",size: 50))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        }      .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        ZStack{
            Rectangle()
                .foregroundColor(.yellow)
                .cornerRadius(40)
                .frame(width: 250, height: 250)
            PhotosPicker(selection: $foto_seleccionada){
                Image(uiImage: foto_a_mostrar ?? UIImage(resource: .avatar))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(.circle)
            }
        }
   
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        .onChange(of: foto_seleccionada) {valor_anterior, valor_nuevo in
            Task{
                if let foto_seleccionada, let datos = try? await
                    foto_seleccionada.loadTransferable(type: Data.self){
                    if let image = UIImage(data: datos){
                        foto_a_mostrar = image
                    }
                }
            }
        }
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
        }      .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        .padding()
    }
}

#Preview {
    ContentView()
}
