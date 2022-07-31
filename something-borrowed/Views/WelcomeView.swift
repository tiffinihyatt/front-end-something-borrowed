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
            HStack {
                Image("app logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height:45)
                Text("something borrowed")
                    .font(.title)
                    .frame(width: 250)
            }
            
            Button(action: {
                print("Clicked log in button")
            }) {
                Text("LOG IN / SIGN UP")
                    .foregroundColor(.white)
                    .bold()
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.pink)
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
