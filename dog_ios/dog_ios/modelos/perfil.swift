//
//  perfil.swift
//  bocetos_IOS
//
//  Created by alumno on 4/7/25.
//


struct Perfil: Codable, Identifiable{
    let id: Int
    
    let name: String
    let username: String
    
    let email: String
    let phone: String
}
