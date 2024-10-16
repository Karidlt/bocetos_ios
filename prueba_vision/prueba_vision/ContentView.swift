//
//  ContentView.swift
//  prueba_vision
//
//  Created by alumno on 16-10-24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State var pulsaciones: Bool = true
    
    var body: some View {
        HStack{
            VStack {
                if pulsaciones{
                    Model3D(named: "Scene", bundle: realityKitContentBundle)
                        .padding(.bottom, 50)
                }
            }
                    Text("Hello, world!")
                    Text("Hello, world! \(pulsaciones)")
                
            Text ("hELLO wORLD")
        
             
            Button(action: {pulsaciones = !pulsaciones
                print ("Hola mundo desde consola \(pulsaciones)")
            }, label: {
                Text(" hola mundo")
        })
        .padding()
                   }
                   }}
                   
#Preview(windowStyle: .automatic) {
    ContentView()
}

