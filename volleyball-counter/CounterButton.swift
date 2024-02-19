//
//  CounterButton.swift
//  volleyball-counter
//
//  Created by Binh Ngo on 2/19/24.
//

import SwiftUI

struct CounterButton: View {
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            color.edgesIgnoringSafeArea(.all)
        }
    }
}
