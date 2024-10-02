//
//  ControladorGeneradorCita.swift
//  boceto_1
//
//  Created by alumno on 27-09-24.
//

import UIKit

class ControladorGeneradorCita: UIViewController{
    var quien_lo_dice: String = ""
    var que_dice: String = ""
    
    var cita_creada: Cita? = nil
    
    
    
    @IBOutlet weak var quien_lo_dijo_view: UITextField!
    
    @IBOutlet weak var que_es_lo_que_dijo: UITextField!
   
    
    
    @IBAction func agregar_cita_nueva(_ sender: UIButton)
    {
        //comprara si si se agrego algo en los campos de texto de  quie lo dijo y que dijo, si son diferentes a "" osea vacio entonces lo guarda como cita creada
        if( quien_lo_dijo_view.text != "" && que_es_lo_que_dijo.text != "" )
            
        {
            cita_creada = Cita(quien_lo_dijo: quien_lo_dijo_view.text!, que_dijo: que_es_lo_que_dijo.text!)
            
        }
        //en caso de que sean vacios imprime que no hay nada
        else{
            print ("No hay nada")
        }
    }
        
    
    override func viewDidLoad()
        {
            super.viewDidLoad()
        }
    }

