//
//  ViewController.swift
//  Boceto_1
//
//  Created by alumno on 9/20/24.
//

import UIKit



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBSegueAction func al_abrir_la_pantalla(_ coder: NSCoder) -> ControladorPantallaCitas? {
        return ControladorPantallaCitas(muro_texto: "Glup Glup", de_quien: "Slime", coder: coder)
    }
    

}

