//
//  WelcomeView.swift
//  something-borrowed
//
//  Created by Tiffini Hyatt on 7/29/22.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Image("something-borrowed-logo")
                    .resizable()
                    .scaledToFit()
                
                Text("Shop Now >")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
