//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Hamed Tara on 2024-02-18.
//

import SwiftUI

struct AnimalGridItemView: View {
    let animal: Animal // Assuming `Animal` is a model defined elsewhere
    
    var body: some View {
        Image(animal.image).resizable().scaledToFit().cornerRadius(12)
    }
}

struct AnimalGridItemView_Previews: PreviewProvider {
  
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalGridItemView(animal: animals[0]) // Display the first animal for preview
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
