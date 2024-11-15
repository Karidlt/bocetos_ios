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
    @IBOutlet weak var idioma_pais: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    
    @IBOutlet weak var populationL: UILabel!
    
    
    @IBOutlet weak var flag: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = country?.countryName
        setupViews()
    }
 
    func setupViews() {
        guard let country = country else { return }
 
        // Nombre del país
        let nameLabel = UILabel()
        nameLabel.text = "Nombre: \(country.countryName)"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
 
        // Capital del país
        let capitalLabel = UILabel()
        capitalLabel.text = "Capital: \(country.countryCapital)"
        capitalLabel.translatesAutoresizingMaskIntoConstraints = false
 
        // Población del país
        let  populationL = UILabel()
        populationL.text = "Población: \(country.population)"
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
        let stackView = UIStackView(arrangedSubviews: [nameLabel, capitalLabel, populationL, flagImageView])
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
