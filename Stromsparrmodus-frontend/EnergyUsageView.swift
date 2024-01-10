//
//  EnergyUsageView.swift
//  Stromsparrmodus-frontend
//
//  Created by Jose Cardona on 10.01.24.
//

import Foundation
import SwiftUI

struct EnergyUsageView: View {
    @State private var selectedPeriod = "Month"
    let periods = ["Day", "Week", "Month", "6M"]

    // Sample data
    let data = [10.0, 20.0, 30.0, 15.0, 25.0]
    let labels = ["Mon", "Tue", "Wed", "Thu", "Fri"]

    var body: some View {
        VStack {
            Picker("Period", selection: $selectedPeriod) {
                ForEach(periods, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            EnergyUsageBarChartView(data: data, labels: labels)
                .frame(height: 200)
                .padding(.horizontal)

            // ... other content for EnergyUsageView ...
        }
        .navigationBarTitle("Energy Usage", displayMode: .inline)
    }
}
