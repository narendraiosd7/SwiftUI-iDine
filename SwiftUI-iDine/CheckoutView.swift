//
//  CheckoutView.swift
//  SwiftUI-iDine
//
//  Created by narendra.vadde on 01/01/21.
//

import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var order: Order
    
    static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    static let tipAmounts = [0, 10, 15, 20, 25]
    
    @State private var paymentType = 0
    @State private var addLoyalityDetails = false
    @State private var loyalityNumber = ""
    @State private var tipAmount = 2
    
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
                
                Toggle(isOn: $addLoyalityDetails.animation()) {
                    Text("Add iDine loyality card")
                }
                
                if addLoyalityDetails {
                    TextField("Enter your iDine ID", text: $loyalityNumber)
                }
            }
            
            Section(header: Text("Add a tip?")) {
                Picker("Percentage", selection: $tipAmount) {
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("TOTAL: $\(totalPrice, specifier: "%.2f")")) {
                Button("Confirm Order") {
                    
                }
            }
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    
    static let order = Order()
    
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
