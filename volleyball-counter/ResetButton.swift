//
//  ResetButton.swift
//  volleyball-counter
//
//  Created by Binh Ngo on 2/19/24.
//

import SwiftUI

import SwiftUI

struct ResetButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("Reset")
                .font(.system(size: UIScreen.main.bounds.width * 0.03))
                .foregroundColor(.white)
                .padding(35)
                .background(Color.black)
                .clipShape(Circle())
        }
    }
}
