//
//  ToolbarView.swift
//  something-borrowed
//
//  Created by Tiffini Hyatt on 7/30/22.
//

import SwiftUI

struct ToolbarView: View {
    @State var selectedPage: SelectedPage = .first
    
    var body: some View {
        VStack {
            VStack {
                switch selectedPage {
                case .first:
                    WelcomeView()
                case .second:
                    BrowseView()
                case .third:
                    NewGarmentView()
                case .fourth:
                    ShoppingBagView()
                }
            }
            
            Spacer()
            
            HStack {
                Button(action: { selectedPage = .first }, label: {
                        VStack {
                            Image("ring logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height:40)
                            Text("Home")
                        }
                    })
                
                Spacer()
                
                Button(action: { selectedPage = .second }, label: {
                        VStack {
                            Image("sparkle logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height:40)
                            Text("Browse")
                        }
                    })
                
                Spacer()
                
                Button(action: { selectedPage = .third }, label: {
                        VStack {
                            Image("hanger logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height:45)
                                .foregroundColor(.black)
                            Text("List an Item")
                        }
                    })
                
                Spacer()
                
                Button(action: { selectedPage = .fourth}, label: {
                        VStack {
                            Image("shopping-bag")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height:40)
                            Text("Bag")
                        }
                    })
            }.padding(.horizontal, 30)
        }
    }
}

enum SelectedPage {
    case first, second, third, fourth
}

struct ToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarView()
    }
}
