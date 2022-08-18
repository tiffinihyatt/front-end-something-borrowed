//
//  SuccessfullyListedView.swift
//  something-borrowed
//
//  Created by Tiffini Hyatt on 8/17/22.
//

import SwiftUI

struct SuccessfullyListedView: View {
    
    @State var keepShopping: Bool = false
    
    var body: some View {
        
        if keepShopping {
            BrowseView()
        } else {
            
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
                    }
                }
                
                VStack {
                    Spacer()
                    
                    Button {
                        keepShopping = true
                    } label: {
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
                    
                    Spacer()
                    Spacer()
                }
                
                Spacer()
            }
        }
    }
}

struct SuccessfullyListedView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessfullyListedView()
    }
}
