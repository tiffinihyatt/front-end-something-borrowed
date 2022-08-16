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
                    Group {
                        Text("")
                        Text("")
                        Text("")
                        Text("")
                        Text("")
                        Text("")
                        Text("")
                        Text("")
                        Text("")
                    }
                    HStack {
                        Image("ring logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height:45)
                        Text("something borrowed")
                            .font(.custom("Avenir-Heavy", size: 30))
                            .frame(width: 300)
                    }
                    
                    Text("once-loved wedding attire")
                        .font(.custom("CormorantGaramond-Regular", size: 24))
                    Text("for the modern nearlywed")
                        .font(.custom("CormorantGaramond-Regular", size: 24))
                }
            }
            
            VStack {
                Text("Welcome!")
                    .font(.custom("Avenir-Medium", size: 24))
                HStack(alignment: .center) {
                    Text("Please select an option below")
                        .font(.custom("Avenir-Medium", size: 20))
                    Image(systemName: "arrow.down.circle")
                }
            }
            
            Spacer()
        
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
