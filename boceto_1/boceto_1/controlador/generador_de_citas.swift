//
//  generador_de_citas.swift
//  boceto_1
//
//  Created by alumno on 18-09-24.
//

import Foundation

class GeneradorDeCitas{
    var citas_creadas: Array<Cita>
    
    init(){
        citas_creadas = []
    }
    
    func agregar_cita_manual(_ que_dijo: String, quien_lo_dijo: String){
        let cita_generada = Cita(quien_lo_dijo: quien_lo_dijo, que_dijo: que_dijo)
        
        citas_creadas.append(cita_generada)
    }
    func agregar_cita(_ cita_nueva: Cita){
        citas_creadas.append(cita_nueva)
    }
    
    
    func generar_citas_falsas(){
        self.agregar_cita_manual("BOOOOOOOOOHHHH",
                     quien_lo_dijo: "Fantasma"
        )
        
        self.agregar_cita_manual("¡La vida es corta, ¡explota al máximo!",
                          quien_lo_dijo: "Creeper"
        )
        
        self.agregar_cita_manual("GRrrrrr grrr grrr GRRRRR grrrgGRGRh",
                          quien_lo_dijo: "Zombie"
        )
        
        self.agregar_cita_manual("con un vacito de leche",
                          quien_lo_dijo: "Pancito"
        )
    }
    
    func obtener_cita_aleatoria() -> Cita{
            var cita_para_regresar: Cita
            cita_para_regresar = citas_creadas[Int.random(in: 0...citas_creadas.count-1)]
            
            return cita_para_regresar
            
        }

    
}
