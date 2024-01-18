//
//  RootView.swift
//  Stromsparrmodus-frontend
//
//  Created by Jose Cardona on 18.01.24.
//

import Foundation
import SwiftUI

struct RootView: View {
    @State private var isAdminMode: Bool = false

    var body: some View {
        VStack {
            if isAdminMode {
                AdminContentView()
            } else {
                ContentView()
            }
            
            // A toggle button for switching between admin and user views
            Button(action: {
                self.isAdminMode.toggle()
            }) {
                Text(isAdminMode ? "Switch to User View" : "Switch to Admin View")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

