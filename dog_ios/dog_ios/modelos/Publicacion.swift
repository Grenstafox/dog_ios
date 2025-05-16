//
//  Publicacion.swift
//  bocetos_IOS
//
//  Created by alumno on 4/7/25.
//

import SwiftUI

/*
 Codable
 Encodable
 Decodable
 
 */

struct Publicacion: Identifiable, Codable{
    let userId: Int
    let id: Int
    
    let title: String
    let body: String
    
}
