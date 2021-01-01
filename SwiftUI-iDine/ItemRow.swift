//
//  ItemView.swift
//  iDine
//
//  Created by narendra.vadde on 01/01/21.
//

import SwiftUI

struct ItemRow: View {
    
    static let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "V": .green, "S": .blue]
    var item: MenuItem
    
    var body: some View {
        
        NavigationLink(destination: ItemDetails(item: item)) {
            HStack {
                Image(item.thumbnailImage)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text("$\(item.price)")
                }
                .layoutPriority(1)
                
                Spacer()
                
                ForEach(item.restrictions, id: \.self) { restriction in
                    Text(restriction)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        .background(Self.colors[restriction, default: .black])
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
