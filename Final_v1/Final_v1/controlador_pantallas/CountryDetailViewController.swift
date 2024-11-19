//
//  CountryDetailViewController.swift
//  Final_v1
//
//  Created by alumno on 08-11-24.
//

import Foundation
import UIKit
 
class CountryDetailViewController: UIViewController {
    var country: Pais?
 
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var moneda_pais: UILabel!
    
    @IBOutlet weak var simbolo_moneda: UILabel!
    @IBOutlet weak var idioma_pais: UILabel!
    
    
    @IBOutlet weak var capital_pais: UILabel!

    
    @IBOutlet weak var populationL: UILabel!
    @IBOutlet weak var continente_pais: UILabel!
    
    @IBOutlet weak var region_pais: UILabel!
    
    
    @IBOutlet weak var flag_pais: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .white
        title = country?.countryName
       // setupViews()
    }
 
    func setupViews() {
        guard let country = country else { return }
 
        // Nombre del país
        let nameLabel = UILabel()
        nameLabel.text = "Name: \(country.countryName)"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
 
        // Capital del país
        let capital_pais = UILabel()
        capital_pais.text = "Capital: \(country.countryCapital)"
        capital_pais.translatesAutoresizingMaskIntoConstraints = false
 
        // Moneda del país
        let  moneda_pais = UILabel()
        moneda_pais.text = "Currency: \(country.currencies)"
        moneda_pais.translatesAutoresizingMaskIntoConstraints = false
        
        // Población del país
        let  populationL = UILabel()
        populationL.text = "Population: \(country.population)"
        populationL.translatesAutoresizingMaskIntoConstraints = false
        
        // Continente del país
        let  contiennteL = UILabel()
        populationL.text = "Continent: \(country.continent)"
        populationL.translatesAutoresizingMaskIntoConstraints = false
        
        // Region
        let  regionL = UILabel()
        populationL.text = "Region: \(country.region)"
        populationL.translatesAutoresizingMaskIntoConstraints = false
 
        // Bandera del país
        let flagImageView = UIImageView()
        if let url = URL(string: country.countryFlag) {
            let data = try? Data(contentsOf: url)
            if let data = data {
                flagImageView.image = UIImage(data: data)
            }
        }
        flagImageView.translatesAutoresizingMaskIntoConstraints = false
        flagImageView.contentMode = .scaleAspectFit
 
        // Agregar las vistas
        let stackView = UIStackView(arrangedSubviews: [nameLabel, capital_pais, populationL, moneda_pais, contiennteL, regionL, flagImageView])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
 
        // Configurar restricciones de auto layout
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
