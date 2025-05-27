//
//  mono_chino.swift
//  bocetos_IOS
//
//  Created by alumno on 4/7/25.
//
import Foundation

struct Perrito: Identifiable, Codable{
    //datos de la api
    let imageUrl: String
    let breed: String
    let id = UUID()
    
    // El resto de las propiedades
    let name: String = "Sin nombre"
    let gender: String = "Desconocido"
    let description: String = "Sin description"
    let ancester: String = "Desconocido"
    
    //Calcular manualmente la raza
    struct APIResponse: Codable {
        let message: [String: [String]]
        let status: String
    }
}
