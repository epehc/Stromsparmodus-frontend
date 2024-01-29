//
//  PaymentHistoryItemView.swift
//  Stromsparrmodus-frontend
//
//  Created by Jose Cardona on 29.01.24.
//

import Foundation
import SwiftUI

struct PaymentHistoryItemView: View {
    var payment: Payment
    @Binding var isExpanded: Bool
    var onDelete: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "creditcard.fill")
                    .foregroundColor(.yellow)
                    .imageScale(.large)
                    .frame(width: 50)
                
                VStack(alignment: .leading) {
                    Text("Date: \(payment.date, formatter: dateFormatter)")
                    Text("Paid: €\(payment.amountPaid, specifier: "%.2f")")
                    Text("Energy Used: \(payment.kWhValue, specifier: "%.2f") kWh")
                }
                
                Spacer()
                
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .foregroundColor(.gray)
            }
            .onTapGesture {
                withAnimation {
                    isExpanded.toggle()
                }
            }
            
            if isExpanded {
                Button("Delete Payment", action: onDelete)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity) // Makes the button take up all available width
                    .padding()
                    .background(Color.red)
                    .cornerRadius(8)
            }
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

