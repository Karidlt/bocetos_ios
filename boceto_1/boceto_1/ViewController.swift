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
    
    @IBOutlet weak var labelcito: UILabel!
    

    override func viewDidLoad() {
        citas_disponibles.generar_citas_falsas()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view
        actualizar_cantidad()
    }
    
    func actualizar_cantidad(){
        labelcito.text = String(citas_disponibles.citas_creadas.count)
    }

    @IBSegueAction func al_abrir_pantalla_cita_tostada(_ coder: NSCoder) -> ControladorPantallaCitas? {
        return ControladorPantallaCitas(cita_para_citar: citas_disponibles.obtener_cita_aleatoria(), coder: coder)
    }
  

    
    @IBSegueAction func al_abrir_pantalla_fantasma(_ coder: NSCoder) -> ControladorPantallaCitas? {
        return ControladorPantallaCitas(cita_para_citar: citas_disponibles.obtener_cita_aleatoria(), coder: coder)   
    }
  
    
   
    
    //--------
    
    @IBAction func al_pulsar_boton(_ sender: UIButton){
        
    }
    
    @IBAction func volver_a_pantalla_inicio(segue: UIStoryboardSegue){
        if let pantalla_agregar_citas = segue.source as?
            ControladorGeneradorCita{
            citas_disponibles.agregar_cita(pantalla_agregar_citas.cita_creada!)
        }
        
        actualizar_cantidad()
    }
    
    //---------------
    

}
