//
//  canino.swift
//  Dog_menu
//
//  Created by alumno on 5/14/25.
//
struct canino: Identifiable, Codable{
    let id: Int
    
    let name: String
    let raza: String
    let peso: Int
    let age: Int
    
    let image: String
    let Ancestro: Ancestro?
}
