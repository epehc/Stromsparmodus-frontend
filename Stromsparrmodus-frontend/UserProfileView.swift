//
//  UserProfileView.swift
//  Stromsparrmodus-frontend
//
//  Created by Jose Cardona on 10.01.24.
//

import Foundation
import SwiftUI

import SwiftUI

struct UserProfileView: View {
    var body: some View {
        Image(systemName: "person.crop.circle.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 40, height: 40)
            .foregroundColor(.gray)
            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
    }
}
