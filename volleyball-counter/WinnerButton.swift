//
//  WinnerButton.swift
//  volleyball-counter
//
//  Created by Binh Ngo on 2/19/24.
//

import SwiftUI

import SwiftUI

struct WinnerButton: View {
    let team: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("Team \(team) wins!")
                .font(.system(size: UIScreen.main.bounds.width * 0.03))
                .foregroundColor(.white)
                .padding()
                .background(Color.black)
                .cornerRadius(10)
        }
    }
}
