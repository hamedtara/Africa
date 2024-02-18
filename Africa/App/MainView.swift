//
//  MainView.swift
//  Africa
//
//  Created by Hamed Tara on 2024-02-10.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            ContentView().tabItem{
                Image(systemName: "square.grid.2x2")
                Text("Browse")
            }
            VideoListView().tabItem {
                Image(systemName: "play.rectangle")
                Text("watch")
            }
            MapView().tabItem {
                Image(systemName: "map")
                Text("locagtion")
            }
            GalleryView().tabItem {
                Image(systemName: "photo")
                Text("Gallery")
            }
        }//Tab
    }
}

#Preview {
    MainView()
}
