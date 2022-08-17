//
//  SuccessfullyListedView.swift
//  something-borrowed
//
//  Created by Tiffini Hyatt on 8/17/22.
//

import SwiftUI

struct SuccessfullyListedView: View {
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    Image("tealArch")
                        .resizable()
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
                    
                    Group {
                        Text("🎉 Cue the confetti!")
                        Text("")
                        Text("Your item has been listed.")
                    }
                    .font(.custom("Avenir-Heavy", size: 28))
                    .frame(width: 400)
                    
//                    NavigationLink(destination: BrowseView()) {
//                        Text("KEEP SHOPPING")
//                            .foregroundColor(.white)
//                            .font(.custom("Avenir-Medium", size: 21))
//                    }
//                    .padding()
//                    .background(
//                        Rectangle()
//                            .fill(Color("darkTeal"))
//                            .frame(width: 300)
//                    )
//
//                    NavigationLink(destination: ShoppingBagView()) {
//                        Text("VIEW SHOPPING BAG")
//                            .foregroundColor(.white)
//                            .font(.custom("Avenir-Medium", size: 21))
//                    }
//                    .padding()
//                    .background(
//                        Rectangle()
//                            .fill(Color("darkTeal"))
//                            .frame(width: 300)
//                    )
                }
            }
            
            VStack {
                Spacer()
                
                NavigationLink(destination: BrowseView()) {
                    Text("KEEP SHOPPING")
                        .foregroundColor(.white)
                        .font(.custom("Avenir-Medium", size: 21))
                }
                .padding()
                .background(
                    Rectangle()
                        .fill(Color("darkTeal"))
                        .frame(width: 300)
                )
                
                NavigationLink(destination: ShoppingBagView()) {
                    Text("VIEW SHOPPING BAG")
                        .foregroundColor(.white)
                        .font(.custom("Avenir-Medium", size: 21))
                }
                .padding()
                .background(
                    Rectangle()
                        .fill(Color("darkTeal"))
                        .frame(width: 300)
                )
                
                Spacer()
                Spacer()
            }
            
            Spacer()
        }
        .frame(width: .infinity, height: .infinity)
//        .background(Color("darkTeal"))
    }
}

struct SuccessfullyListedView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessfullyListedView()
    }
}
