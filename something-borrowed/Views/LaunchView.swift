//
//  LaunchView.swift
//  something-borrowed
//
//  Created by Tiffini Hyatt on 8/17/22.
//

import SwiftUI

struct LaunchView: View {
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.8
    
    var body: some View {
        
        if isActive {
            ContentView()
        } else {
            VStack {
                VStack {
                    Image("ring logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                    Text("something borrowed")
                        .font(.custom("Avenir-Heavy", size: 30))
                        .frame(width: 300)
                    Group {
                        Text("")
                        Text("")
                        Text("")
                        Text("")
                        Text("")
                        Text("")
                        Text("")
                    }
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.00
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
