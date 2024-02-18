//
//  ExternalWebView.swift
//  Africa
//
//  Created by Hamed Tara on 2024-02-12.
//

import SwiftUI

struct ExternalWebView: View {
    let animal: Animal
    var body: some View {
        Group {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group{
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!))
                }.foregroundColor(.accentColor)
            }
        }
    }
}

struct ExternalWebView_PreView: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalWebView(animal: animals[0]).previewLayout(.sizeThatFits).padding()
    }
}


