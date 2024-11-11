//
//  provedor_api_paises.swift
//  Final_v1
//
//  Created by alumno on 08-11-24.
//

import Foundation
// Crear una clase para manejar la API
//Crea una clase APIService para manejar la solicitud HTTP a la API de restcountries.com usando URLSession.
 
 
import UIKit


class APIService {
    
    let urlString = "https://restcountries.com/v3.1/all"
    var lista_paises: [Pais] = []
    
    func fetchCountries(completion: @escaping ([Pais]?) -> Void) {
     
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let countries = try JSONDecoder().decode([Pais].self, from: data)
                completion(countries)
            } catch let jsonError {
                print("Failed to decode JSON: \(jsonError)")
                completion(nil)
            }
        }.resume()
        
        /*
         func fetchRegions(completion: @escaping ([String]?) -> Void) {
         let urlString = "https://restcountries.com/v3.1/all?fields"
         guard let url = URL(string: urlString) else {
         print("URL inválida")
         return
         }
         
         URLSession.shared.dataTask(with: url) { data, response, error in
         if let error = error {
         print("Error al obtener datos: \(error)")
         completion(nil)
         return
         }
         
         guard let data = data else {
         print("No se recibió data")
         completion(nil)
         return
         }
         
         do {
         let paises = try JSONDecoder().decode([Pais].self, from: data)
         
         // Extrae las regiones y elimina duplicados
         let regions = Set(paises.compactMap { $0.region }).sorted()
         print("Regiones obtenidas: \(regions)") // Imprimir las regiones para verificar
         
         completion(Array(regions))
         } catch let jsonError {
         print("Error de decodificación de JSON: \(jsonError)")
         completion(nil)
         }
         }.resume()
         }
         
         
         
         func fetchCountries(completion: @escaping ([Pais]?) -> Void) {
         let urlString = "https://restcountries.com/v3.1/all"
         guard let url = URL(string: urlString) else {
         print("URL inválida")
         return
         }
         
         URLSession.shared.dataTask(with: url) { data, response, error in
         if let error = error {
         print("Error al obtener datos: \(error)")
         completion(nil)
         return
         }
         
         guard let data = data else {
         print("No se recibió data")
         completion(nil)
         return
         }
         
         do {
         let name = try JSONDecoder().decode([Pais].self, from: data)
         print("Datos de países obtenidos: \(name.count) países")
         completion(name)
         } catch let jsonError {
         print("Error de decodificación de JSON: \(jsonError)")
         completion(nil)
         }
         }.resume()
         }*/
    }
}

