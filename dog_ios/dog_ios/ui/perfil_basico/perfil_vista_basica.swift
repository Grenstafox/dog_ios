//
//  perfil_vista_basica.swift
//  bocetos_IOS
//
//  Created by alumno on 4/7/25.
//

import SwiftUI

struct PerfilBasicoVista: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View{
        Text("User: \(controlador.perfil_a_mostrar?.username ?? "Puede que no")")
        Text("Nombre: \(controlador.perfil_a_mostrar?.name ?? "sea bonito ver estas")")
        Text("Correo: \(controlador.perfil_a_mostrar?.email ?? "palabras de error")")
            .onDisappear(){
                print("Adios mundo curel,")
            }
    }
}

#Preview {
    MenuNavegacion()
        .environment(ControladorAplicacion())
}
