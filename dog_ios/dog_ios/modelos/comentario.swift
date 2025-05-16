//
//  comentario.swift
//  bocetos_IOS
//
//  Created by alumno on 4/7/25.
//

import SwiftUI


struct Comentario: Identifiable, Codable{
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
