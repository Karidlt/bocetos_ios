//
//  Paises.swift
//  Final_v1
//
//  Created by alumno on 08-11-24.
//

import Foundation
struct  Pais: Codable {
    let name: Name
    let capital: [String]?
    let languages: [String: String]?
    let currencies: [String: Currencies]?
    let population: Int
    let region: String
    let flags: Flags
    let continent: String?
    
    struct Name: Codable {
        let common: String
    }
    
    struct Currencies: Codable
    {
        let name: String
        let symbol: String
    }
    
    struct Flags: Codable {
        let png: String
    }
    
    var countryName: String {
        return name.common
    }
    
    var countryCapital: String {
        return capital?.first ?? "No disponible"
    }
   /* var countryLanguages: String{
        return languages?.
    }*/
    
    var countryFlag: String {
        return flags.png
    }
}
