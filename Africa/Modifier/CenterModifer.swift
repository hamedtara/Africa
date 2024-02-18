//
//  CenterModifer.swift
//  Africa
//
//  Created by Hamed Tara on 2024-02-18.
//

import SwiftUI

struct CenterModifer : ViewModifier{
    func body(content: Content) -> some View {
        HStack{
            Spacer()
            content
            Spacer()
        }
    }
}
