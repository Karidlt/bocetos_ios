//
//  provedor_api_paises.swift
//  Final_v1
//
//  Created by alumno on 08-11-24.
//

import Foundation
// Crear una clase para manejar la API
//Crea una clase APIService para manejar la solicitud HTTP a la API de restcountries.com usando URLSession.
 
 
import Foundation
 
class APIService {
    func fetchCountries(completion: @escaping ([Pais]?) -> Void) {
        let urlString = "https://restcountries.com/v3.1/all"
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
    }
}
