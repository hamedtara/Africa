//
//  CoverImageView.swift
//  Africa
//
//  Created by Hamed Tara on 2024-02-11.
//

import SwiftUI

struct CoverImageView: View {
    // Mark: - Properties
    let coverImages : [CoverImage] = Bundle.main.decode("covers.json")
    
    //Mark : BODY
    var body: some View {
        TabView{
            ForEach(coverImages) { item in
                Image(item.name).resizable().scaledToFill()
            } //loop
        } //: Tab
        .tabViewStyle(PageTabViewStyle())
      
      
    }
}
// Mark: -Preciew

#Preview {
    CoverImageView()
        .previewLayout(.fixed(width: 400, height: 300))
}
