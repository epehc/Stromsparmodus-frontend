//
//  PaymentSummaryView.swift
//  Stromsparrmodus-frontend
//
//  Created by Jose Cardona on 10.01.24.
//

import Foundation
import SwiftUI

struct PaymentSummaryView: View {
    var body: some View {
        HStack {
            Image(systemName: "creditcard.fill")
                .foregroundColor(.green)
                .imageScale(.large)
                .frame(width: 50)

            VStack(alignment: .leading) {
                Text("Payments")
                    .font(.headline)
                Text("Last Payment: 01 Jan 2024")
                    .font(.subheadline)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
    }
}

