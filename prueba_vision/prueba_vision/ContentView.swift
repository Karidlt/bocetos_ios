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
    var body: some View {
        VStack {
            Model3D(named: "Scene", bundle: realityKitContentBundle)
                .padding(.bottom, 50)

            Text("Hello, world!")
            Text("Hello, world!")
            Button(action: {print("hola mundo desde consola")}, label: {Text("Hola mundo")})
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
