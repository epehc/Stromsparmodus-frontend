//
//  EnergyUsageSummaryView.swift
//  Stromsparrmodus-frontend
//
//  Created by Jose Cardona on 10.01.24.
//

import Foundation
import SwiftUI

struct EnergyUsageSummaryView: View {
    @ObservedObject var paymentDataStore: PaymentDataStore
    @State private var latestPayment: Payment?
    var body: some View {
            HStack {
                Image(systemName: "bolt.horizontal.fill")
                    .foregroundColor(.yellow)
                    .imageScale(.large)
                    .frame(width: 50)

                VStack(alignment: .leading) {
                    Text("Usage")
                        .font(.headline)
                    if let latestPayment = latestPayment {
                                    Text("Current Month: \(latestPayment.kWhValue, specifier: "%.2f") kWh")
                                    .font(.subheadline)
                                } else {
                                    Text("No data for current month")
                                    .font(.subheadline)
                                }
                        
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(10)
            .onAppear{
                latestPayment = paymentDataStore.getLatestPayment()
            }
    }
}
