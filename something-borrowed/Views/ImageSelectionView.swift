//
//  ImageSelectionView.swift
//  something-borrowed
//
//  Created by Tiffini Hyatt on 8/14/22.
//

import SwiftUI

struct ImageSelectionView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Button(action: {
                
            }, label: {
                Image("addListingImage")
                    .resizable()
                    .frame(width: 220, height: 220, alignment: .center)
                    .clipShape(Circle())
                
                
        })
            Image(systemName: "plus")
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
                .background(.gray)
                .clipShape(Circle())
        }
    }
}

struct ImageSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSelectionView()
    }
}
