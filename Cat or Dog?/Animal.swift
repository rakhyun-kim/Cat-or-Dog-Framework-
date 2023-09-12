//
//  Animal.swift
//  Cat or Dog?
//
//  Created by Rakhyun Kim on 9/12/23.
//

import Foundation

class Animal {
    
    // Url for the image
    var imageUrl: String
    
    // Image data
    var imageData: Data?
    
    init() {
        
        self.imageUrl = ""
        self.imageData = nil
        
    }
    
    init?(json: [String: Any]) {
        
        // Check that JSON has a url
        guard let imageUrl = json["url"] as? String else {
            return nil
        }
        // Set the animal properties
        self.imageUrl = imageUrl
        self.imageData = nil
        // Download the image data
        getImage()
        
    }
    
    func getImage() {
        
        // Create a URL object
        let url = URL(string: imageUrl)
        
        // Check that the URL isn`t nil
        guard url != nil else {
            print("Couldn`t get URL object")
            return
        }
        
        // Get a URL session
        let session = URLSession.shared
        
        // Create the data task
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            // Check that there are no errors and that there was data
            if error == nil && data != nil {
                self.imageData = data
                
            }
        }
        // Start the data task
        dataTask.resume()
    }
}
