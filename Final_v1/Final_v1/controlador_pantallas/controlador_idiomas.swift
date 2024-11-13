//
//  controlador_idiomas.swift
//  Final_v1
//
//  Created by alumno on 13-11-24.
//

import Foundation
import UIKit

 
class Controlador_idiomas: UITableViewController {
    let apiService = APIService()
  //  var idiomas: [String] = []
    var continente: [String] = []
    //var paises : String = ""
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Llamada a fetchRegions para obtener la lista de continentes/idiomas dinámicamente
        apiService.fetchCountries{ [weak self] paises in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if let paises = paises {
                    self.continente = Array(Set(paises.compactMap{$0.continent})).sorted()
                    self.tableView.reloadData()
                    print("aaaa")
                }
            }
        }
    }
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return continente.count
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = continente[indexPath.row]
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedLanguage = continente[indexPath.row]
        // Lógica para pasar al siguiente ViewController con la región seleccionada
    }
}
