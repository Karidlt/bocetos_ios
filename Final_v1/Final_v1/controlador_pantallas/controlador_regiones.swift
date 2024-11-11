//
//  controlador_regiones.swift
//  Final_v1
//
//  Created by alumno on 08-11-24.
//

import Foundation
import UIKit

 
class Controlador_regiones: UITableViewController {
    let apiService = APIService()
    var regions: [String] = []
    //var paises : String = ""
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Llamada a fetchRegions para obtener la lista de regiones dinámicamente
        apiService.fetchCountries{ [weak self] paises in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if let paises = paises {
                    self.regions = Array(Set(paises.compactMap{$0.region})).sorted()
                    self.tableView.reloadData()
                    print("aaaa")
                }
            }
        }
    }
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regions.count
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = regions[indexPath.row]
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRegion = regions[indexPath.row]
        // Lógica para pasar al siguiente ViewController con la región seleccionada
    }
}

/*class   Controlador_regiones: UITableViewController {
    let regions = ["Africa", "Americas", "Asia", "Europe", "Oceania"]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Regiones"
    }
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regions.count
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = regions[indexPath.row]
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRegion = regions[indexPath.row]
        let countryListVC = Controlador_paises()
        countryListVC.region = selectedRegion
        navigationController?.pushViewController(countryListVC, animated: true)
    }
}*/