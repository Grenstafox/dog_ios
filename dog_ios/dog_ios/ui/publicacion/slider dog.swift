//
//  slider dog.swift
//  dog_ios
//
//  Created by alumno on 5/21/25.
//

import SwiftUI

struct Slider: View {
    var body: some View {
        Slider_Dog()
    }
}

struct Slider_Dog: View {
    public let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State private var selection = 0
    
    let images = ["Golden","pastor","puff_dogs"]
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
        VStack{
            ZStack{
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: 400, height: 350)
                TabView(selection: $selection){
                    ForEach(0..<3){ i in
                        Image("\(images[i])").resizable()
                    }
                    .frame(width: 300, height: 300)
                    .shadow(radius: 10)
                    .cornerRadius(40)
                }
            }.tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                    .onReceive(timer, perform: { _ in
                        withAnimation{
                            selection = selection < 3 ? selection + 1 : 0
                        }
                    })
            }.ignoresSafeArea()
        }
    }
#Preview{
    Slider_Dog()
}
