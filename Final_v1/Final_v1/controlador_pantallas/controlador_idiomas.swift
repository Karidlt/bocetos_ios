//
//  controlador_idiomas.swift
//  Final_v1
//
//  Created by alumno on 13-11-24.
//
import Foundation
import UIKit
 
class LanguagesViewController: UITableViewController {
    
    var languages: [String] = []
    var seleccion_lenguaje: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Idiomas"
        fetchLanguages()
    }
    
    func fetchLanguages() {
        APIService().fetchCountries { [weak self] countries in
            guard let self = self else { return }
            
            if let countries = countries {
                var languageSet = Set<String>()
                for country in countries {
                    if let languages = country.languages {
                        for language in languages.values {
                            languageSet.insert(language)
                        }
                    }
                }
                self.languages = Array(languageSet).sorted()
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = languages[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedLanguage = languages[indexPath.row]
        seleccion_lenguaje = selectedLanguage
        
        print("\(selectedLanguage)")
        let countriesVC = CountriesByLanguageViewController()
        countriesVC.language = selectedLanguage
        navigationController?.pushViewController(countriesVC, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let pantalla_paises = segue.destination as? CountriesByLanguageViewController
        
        print(seleccion_lenguaje)
        pantalla_paises?.language = seleccion_lenguaje
    }
}
