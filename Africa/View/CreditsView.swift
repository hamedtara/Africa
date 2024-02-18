//
//  CreditsView.swift
//  Africa
//
//  Created by Hamed Tara on 2024-02-18.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass").resizable().scaledToFit().frame(width: 128, height: 128)
            Text("""
                 Copyright © Hamed Tara
    All right reserved ♡
    """)
            .font(.footnote)
        .multilineTextAlignment(.center)
        }.padding().opacity(0.8)
    }
}

#Preview {
    CreditsView().previewLayout(.sizeThatFits).padding()
}

