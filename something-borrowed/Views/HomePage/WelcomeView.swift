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
            ZStack {
                VStack {
                    Image("tealArch")
                        .resizable()
//                        .aspectRatio(contentMode: .fit)
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 500)
                }
                
                VStack {
                    HStack {
                        Image("ring logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height:45)
                        Text("something borrowed")
                            .font(.title)
                            .frame(width: 250)
                    }
                    
                    Text("gently used wedding attire")
                        .font(.headline)
                    Text("for the modern bride")
                        .font(.headline)
                }
            }
            Spacer()
//
//                VStack {
//                    Text("Get started below!")
//                        .font(.title3)
//                    Image(systemName: "arrow.down")
//                }
//            Spacer()
//            Spacer()
//            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
