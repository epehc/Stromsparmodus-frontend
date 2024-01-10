//
//  EnergyUsageSummaryView.swift
//  Stromsparrmodus-frontend
//
//  Created by Jose Cardona on 10.01.24.
//

import Foundation
import SwiftUI

struct EnergyUsageSummaryView: View {
    var body: some View {
        // This view should be designed to match the summary appearance you want
        Text("Usage Summary")
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(8)
    }
}
