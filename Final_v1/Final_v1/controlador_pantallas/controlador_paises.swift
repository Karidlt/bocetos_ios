//
//  controlador_paises.swift
//  Final_v1
//
//  Created by alumno on 08-11-24.
//

import Foundation
import UIKit
 
class Controlador_paises: UITableViewController {
    var region: String?
    var paises = [Pais]()
    let apiService = APIService()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        title = region
        fetchCountries()
    }
 
    func fetchCountries() {
        apiService.fetchCountries { [weak self] paises in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if let paises = paises {
                    self.paises = paises.filter { $0.region == self.region }
                    self.tableView.reloadData()
                }
            }
        }
    }
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paises.count
    }
 
    /*override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedCountry = paises [indexPath.row]
        let detailVC = CountryDetailViewController()
    detailVC.country = selectedCountry
            navigationController?.pushViewController(detailVC, animated: true)
        }*/
    }
