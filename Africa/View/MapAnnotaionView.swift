//
//  MapAnnotaionView.swift
//  Africa
//
//  Created by Hamed Tara on 2024-02-17.
//

import SwiftUI

struct MapAnnotaionView: View {
    @State private var animation : Double = 0.0
    var location: NationalParkLocation
    
    var body: some View {
        ZStack {
            Circle().fill(Color(.accent))
                .frame(width: 54,height: 54,alignment: .center)
            
            
            Circle().stroke(Color.accentColor,lineWidth: 2)
                .frame(width: 52,height: 52,alignment: .center)
                .scaleEffect(1+CGFloat(animation))
                .opacity(1-animation)
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48,height: 48,alignment: .center)
            .clipShape(.circle)
        }
        .onAppear{
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)){
                animation = 1 ;
            }
        }
    }
}

struct MapAnnotaionView_Preview: PreviewProvider{
    static var locations:[NationalParkLocation] = Bundle.main.decode("locations.json")
    
    static var previews: some View{
        MapAnnotaionView(location: locations[0]).previewLayout(.sizeThatFits).padding()

    }
}
