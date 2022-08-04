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
                }
            }
            
            Spacer()
            
            HStack {
                Button(action: { selectedPage = .first }, label: {
                        VStack {
                            Image("ring logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height:45)
                            Text("Home")
                        }
                    })
                
//                Spacer()
                
                Button(action: { selectedPage = .second }, label: {
                        VStack {
                            Image("sparkle logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height:45)
                            Text("Browse")
                        }
                    })
                
//                Spacer()
                
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
            }.padding(.horizontal, 30)
        }
    }
}

enum SelectedPage {
    case first, second, third
}
        
//        NavigationView {
//            WelcomeView()
//                .toolbar {
//                    ToolbarItemGroup(placement: .bottomBar) {
//                        Spacer()
//
//                        Button {
//                            print("Pressed home")
//                        } label: {
//                            VStack {
//                                Image("ring logo")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(height:45)
//                                Text("Home")
//                            }
//                        }
//
////                        Spacer()
//
//                        Button {
//                            print("Pressed browse")
//                        } label: {
//                            VStack {
//                                Image("sparkle logo")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(height:45)
//                                Text("Browse")
//                            }
//                        }
//
////                        Spacer()
//
//                        Button {
//                            print("Pressed list an item")
//                        } label: {
//                            VStack {
//                                Image("hanger logo")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(height:45)
//                                    .foregroundColor(.black)
//                                Text("List an Item")
//                            }
//                        }
//
////                        Spacer()
//
//                        Button {
//                            print("Pressed shopping bag")
//                        } label: {
//                            VStack {
//                                Image("shopping-bag")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(height:45)
//                                Text("Bag")
//                            }
//                        }
//
//                        Spacer()
//                    }
//                }
//        }
//    }
//}

struct ToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarView()
    }
}
