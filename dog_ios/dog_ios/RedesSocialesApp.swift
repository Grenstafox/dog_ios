//
//  bocetos_IOSApp.swift
//  bocetos_IOS
//
//  Created by alumno on 4/7/25.
//

import SwiftUI

@main
@MainActor
struct RedesSocialesApp: App {
    @State var controlador = ControladorAplicacion()
   
    var body: some Scene {
        WindowGroup {
            MenuNavegacion()
                .environment(controlador)
        }
    }
}
