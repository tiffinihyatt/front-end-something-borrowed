//
//  ToolbarView.swift
//  something-borrowed
//
//  Created by Tiffini Hyatt on 7/30/22.
//

import SwiftUI

struct ToolbarView: View {
    var body: some View {
        
        NavigationView {
            WelcomeView()
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Button {
                            print("Pressed home")
                        } label: {
                            VStack {
                                Image("app logo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height:45)
                                Text("Home")
                            }
                        }
                        
                        Spacer()
                        
                        Button("Browse") {
                            print("Pressed browse")
                        }
                        
                        Spacer()
                        
                        Button {
                            print("Pressed list an item")
                        } label: {
                            VStack {
                                Image(systemName: "plus.app")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height:30)
                                    .foregroundColor(.black)
                                Text("List an Item")
                            }
                        }
                        
                        Spacer()
                        
                        Button("Shopping Bag") {
                            print("Pressed shopping bag")
                        }
                    }
                }
        }
    }
}

struct ToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarView()
    }
}
