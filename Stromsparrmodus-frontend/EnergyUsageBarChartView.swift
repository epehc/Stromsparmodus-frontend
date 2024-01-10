//
//  EnergyUsageBarChartView.swift
//  Stromsparrmodus-frontend
//
//  Created by Jose Cardona on 10.01.24.
//

import Foundation
import SwiftUI

struct EnergyUsageBarChartView: View {
    let data: [Double]
    let labels: [String]
    
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .bottom, spacing: 0) {
                ForEach(0..<data.count, id: \.self) { index in
                    VStack {
                        Text(String(format: "%.1f", data[index]))
                            .font(.caption)
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: (geometry.size.width / CGFloat(data.count)) - 10, height: CGFloat(data[index]) * 5)
                        Text(labels[index])
                            .font(.caption)
                    }
                }
            }
        }
    }
}
