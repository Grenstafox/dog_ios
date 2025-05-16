//
//  planeta.swift
//  bocetos_IOS
//
//  Created by alumno on 4/7/25.
//


struct Planeta: Identifiable, Codable{
    let id: Int
    let name: String
    let isDestroyed: Bool
    let description: String
    let image: String
}
