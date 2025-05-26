//
//  mono_chino.swift
//  bocetos_IOS
//
//  Created by alumno on 4/7/25.
//
import Foundation

struct Perrito: Identifiable, Codable{
    //datos de la api
    let image: String
    let breed: String
    
    // El resto de las propiedades
    let id = UUID()
    let name: String = "Sin nombre"
    let race: String
    let gender: String = "Desconocido"
    let description: String = "Sin description"
    let ancester: String = "Desconocido"
    
    //Calcular manualmente la raza
    init(image: String, breed: String) {
        self.image = image
        self.breed = breed
        self.race = breed
    }
}
