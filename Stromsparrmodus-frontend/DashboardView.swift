//
//  DashboardView.swift
//  Stromsparrmodus-frontend
//
//  Created by Jose Cardona on 10.01.24.
//

import Foundation
import SwiftUI

struct DashboardView: View {
    @State private var isShowingAccountDetails = false

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Summary")
                        .font(.largeTitle)
                    Spacer()
                    UserProfileView()
                        .padding()
                        .onTapGesture {
                            self.isShowingAccountDetails.toggle()
                        }
                }
                // Placeholders for summary views that could be navigated to, if needed.
                NavigationLink(destination: EnergyUsageView()) {
                    EnergyUsageSummaryView()
                }
                NavigationLink(destination: PaymentHistoryView()) {
                    PaymentSummaryView()
                }
                Spacer()
            }
            .padding()
            .sheet(isPresented: $isShowingAccountDetails) {
                AccountDetailsView()
            }
            .navigationBarTitle("Dashboard", displayMode: .inline)
        }
    }
}
