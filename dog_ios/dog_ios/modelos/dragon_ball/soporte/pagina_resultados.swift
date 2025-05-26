//
//  pagina_resultados.swift
//  bocetos_IOS
//
//  Created by alumno on 4/7/25.
//


struct Meta: Codable{
    let totalItems: Int
    let itemCount: Int
    let itemsPerPage: Int
    let totalPages: Int
    let currentPage: Int
}

struct Enlaces: Codable{
    let first: String
    let previous: String
    let next: String
    let last: String
}

struct PaginaResultado: Codable { //, Identifiable {
    //var id: Int = self.meta.currentPage
    let items: [Perrito]
    let meta: Meta
    let links: Enlaces
}

//

