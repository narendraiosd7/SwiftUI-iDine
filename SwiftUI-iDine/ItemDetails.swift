//
//  ItemDetails.swift
//  iDine
//
//  Created by narendra.vadde on 01/01/21.
//

import SwiftUI

struct ItemDetails: View {
    
    var item: MenuItem
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            
            Text(item.description)
                .padding()
            Spacer()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

struct ItemDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetails(item: MenuItem.example)
        }
    }
}
