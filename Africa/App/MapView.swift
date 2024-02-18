//
//  MapView.swift
//  Africa
//
//  Created by Hamed Tara on 2024-02-10.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region:MKCoordinateRegion = {
        var mapCordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCordinates, span: mapZoomLevel)
        return mapRegion;
    }()
   
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    var body: some View {
       // Map(coordinateRegion: $region)
        //Text("Map")
        
        Map(coordinateRegion: $region, annotationItems: locations , annotationContent: {
            item in
            
            //A PIN : OLD Style (always static)
            
//            MapPin(coordinate: item.location, tint: .accentColor)
            
            
//            MapMarker(coordinate: item.location, tint: .accentColor)
//
//            MapAnnotation(coordinate: item.location){
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32,height: 32,alignment: .center)
//
//            }
            
            MapAnnotation(coordinate: item.location){
                MapAnnotaionView(location: item)
                    
            }
        })
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36, height: 36, alignment: .center)
                
                VStack(alignment: .leading , spacing: 3){
                    HStack{
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accent)
                        Spacer()
                        Text("\(region.center.latitude)").font(.footnote)
                            .foregroundColor(.white)
                    }
                Divider()
                    HStack{
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accent)
                        Spacer()
                        Text("\(region.center.longitude)").font(.footnote)
                            .foregroundColor(.white)
                    }
            }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.2)
            ),
            alignment: .top // Correctly placed alignment for the overlay
        )
        .padding()
    }
}

#Preview {
    MapView()
}
