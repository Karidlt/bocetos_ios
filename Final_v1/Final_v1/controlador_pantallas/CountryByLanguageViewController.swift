//
//  CountryByLanguageViewController.swift
//  Final_v1
//
//  Created by alumno on 15-11-24.
//

import Foundation
import UIKit
 
class CountriesByLanguageViewController: UITableViewController {
    
    var language: String?
    var countries: [Pais] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Países que hablan \(language ?? "")"
        print("Estamos auqi \(language)")
        fetchCountriesByLanguage()
    }
    
    func fetchCountriesByLanguage() {
        guard let selectedLanguage = language else { return }
        
        APIService().fetchCountries { [weak self] countries in
            guard let self = self else { return }
            
            print(countries)
            
            if let countries = countries {
                self.countries = countries.filter { country in
                    country.languages?.values.contains(selectedLanguage) ?? false
                }
                
                DispatchQueue.main.async {
                    print(self.countries.count)
                    self.tableView.reloadData()
                    
                }
                
            }else {
                print("Estamos fuera del if")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row].name.common
        return cell
    }

}
