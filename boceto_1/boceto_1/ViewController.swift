//
//  ViewController.swift
//  boceto_1
//
//  Created by alumno on 18-09-24.
//

import UIKit


class ViewController: UIViewController {
    var cita_para_enviar: Cita = Cita(quien_lo_dijo: "Creeper", que_dijo: "Tssseñor")
    var citas_disponibles: GeneradorDeCitas = GeneradorDeCitas()

    override func viewDidLoad() {
        citas_disponibles.generar_citas_falsas()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view
    }

    
    @IBSegueAction func al_abrir_pantalla_citas(_ coder: NSCoder) -> ControladorPantallaCitas? {
        return ControladorPantallaCitas(cita_para_citar: citas_disponibles.obtener_cita_aleatoria(), coder: coder)
    }
    
    @IBSegueAction func minuevafuncion(_ coder: NSCoder) -> ControladorPantallaCitas? {
        return ControladorPantallaCitas(cita_para_citar:  citas_disponibles.obtener_cita_aleatoria(), coder: coder)
    }
    
    @IBSegueAction func mi_nueva_func2(_ coder: NSCoder) -> ControladorPantallaCitas? {
        return ControladorPantallaCitas(cita_para_citar:  citas_disponibles.obtener_cita_aleatoria(), coder: coder)
        
    }
}
