//
//  HeadingView.swift
//  Africa
//
//  Created by Hamed Tara on 2024-02-12.
//

import SwiftUI

struct HeadingView: View {
    var headingImage : String
    var headingText: String
    
    var body: some View {
        
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            
            Text("heading Text")
                .font(.title3)
                .fontWeight(.bold)
            
        }.padding(.vertical)
    }
}

#Preview {
    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "wilderness in Pictures").previewLayout(.sizeThatFits).padding()
}
