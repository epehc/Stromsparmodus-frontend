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
            HStack {
                Image(systemName: "bolt.horizontal.fill")
                    .foregroundColor(.yellow)
                    .imageScale(.large)
                    .frame(width: 50)

                VStack(alignment: .leading) {
                    Text("Usage")
                        .font(.headline)
                    Text("Current Month: 123 kWh")
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
