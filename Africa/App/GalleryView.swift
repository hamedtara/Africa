//
//  GalleryView.swift
//  Africa
//
//  Created by Hamed Tara on 2024-02-10.
//

import SwiftUI

struct GalleryView: View {
    
    @State private var selectedAnimal: String = "lion"
    
    let animals : [Animal] = Bundle.main.decode("animals.json")
    
    let heptic = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var gridItem : [GridItem] = [GridItem(.flexible())]
    @State private var gridC : Double = 3
    
    func gridSwitch(){
        gridItem = Array(repeating: .init(.flexible()), count: Int(gridC))
    }
    
//    let gridItem : [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            
            VStack(alignment:.center,spacing: 30) {
                
                Image(selectedAnimal).resizable().scaledToFit().clipShape(Circle())
                    .overlay(Circle().stroke(Color.white,lineWidth:8))
                
                
                
                Slider(value: $gridC,in: 2...4,step:1)
                    .padding(.horizontal)
                    .onChange(of: gridC, perform:{
                        value in gridSwitch()
                    })
                
                LazyVGrid(columns: gridItem,alignment: .center,spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image).resizable().scaledToFit().clipShape(Circle()).overlay(Circle().stroke(Color(.white),lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal=item.image
                                heptic.impactOccurred()
                            }
                    }
                }.animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
            }.padding(.horizontal,10)
                .padding(.vertical,10)
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(MotionAnimaionView())
    }
}

#Preview {
    GalleryView()
}
