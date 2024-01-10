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
        // This view should be designed to match the summary appearance you want
        Text("Payments Summary")
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(8)
    }
}
