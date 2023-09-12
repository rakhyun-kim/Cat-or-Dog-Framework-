//
//  Cat_or_Dog_App.swift
//  Cat or Dog?
//
//  Created by Rakhyun Kim on 9/12/23.
//

import SwiftUI

@main
struct Cat_or_Dog_App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(model: AnimalModel())
            
        }
    }
}
