//
//  VideoListView.swift
//  Africa
//
//  Created by Hamed Tara on 2024-02-10.
//

import SwiftUI

struct VideoListView: View {
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)

    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoListItemView(video: item).padding(.vertical,8)
                    }
                }
            }.listStyle(InsetGroupedListStyle())
                .navigationTitle("Videos")
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button(action :{
                            videos.shuffle()
                            hapticImpact.impactOccurred()
                        }){
                            Image(systemName: "arrow.2.squarepath")
                        }
                    }
                }
        }
    }
}

#Preview {
    VideoListView()
}
