//
//  ContentView.swift
//  Cat or Dog?
//
//  Created by Rakhyun Kim on 9/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model: AnimalModel
    
    var body: some View {
        VStack {
            VStack {
                Image(uiImage: UIImage(
                    data: model.animal.imageData ?? Data()) ?? UIImage())
                .resizable()
                .scaledToFill()
                .clipped()
                .edgesIgnoringSafeArea(.all)
                
                HStack{
                    
                    Text("What is it?")
                        .font(.title)
                        .bold()
                        .padding(.leading, 10)
                    
                    Spacer()
                    
                    Button {
                        self.model.getAnimal()
                    } label: {
                        Text("Next")
                            .bold()
                    }
                    .padding(.trailing, 10)

                }
            }
            .onAppear(perform: model.getAnimal)
            .opacity(model.animal.imageData == nil ? 0 : 1)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: AnimalModel())
    }
}
