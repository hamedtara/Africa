//
//  MotionAnimaionView.swift
//  Africa
//
//  Created by Hamed Tara on 2024-02-17.
//

import SwiftUI

struct MotionAnimaionView: View {
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimated : Bool = false;
    
    
    //1. RANDOM COORDINATE
    func randomCordinate(max:CGFloat)-> CGFloat{
        return CGFloat.random(in: 0...max)
    }
    //2. RANDOM SIZE
    func randomSize() -> CGFloat{
        return CGFloat(Int.random(in: 10...300))
    }
    
    //3. RANDOM SCALE
    
    func randomScale() -> CGFloat{
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    //4. RANDOM SPEED
    func randomSpeed() -> Double{
        return Double.random(in: 0.026...1)
    }
    
    //5. RANDOM DELAY
    
    func delay() -> Double{
        return Double.random(in: 0...2)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle,id:\.self) { item in
                    Circle().foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize() ,height: randomSize() ,alignment: .center)
                        .scaleEffect(isAnimated ? randomScale() : 1)
                        .position(x:randomCordinate(max: geometry.size.width)
                                  ,
                                  y:randomCordinate(max: geometry.size.height)
                                  )
                        .animation(Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                        .repeatForever()
                        .speed(randomSpeed())
                        .delay(delay())
                        ).onAppear(perform: {
                            isAnimated = true;
                        })
                }
                
             
            }
        }.drawingGroup()
    }
}

#Preview {
    MotionAnimaionView()
}
