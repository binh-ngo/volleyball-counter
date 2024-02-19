//
//  TeamCounter.swift
//  volleyball-counter
//
//  Created by Binh Ngo on 2/19/24.
//

import SwiftUI

struct TeamCounter: View {
    @Binding var points: Int
    @Binding var teamAPoints: Int
    @Binding var teamBPoints: Int
    let color: Color
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                CounterButton(color: color) { incrementPoints() }
                CounterButton(color: color) { decrementPoints() }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            Button(action: incrementPoints) {
                Text("\(points)")
                    .font(.system(size: UIScreen.main.bounds.width * 0.15))
                    .foregroundColor(.white)
            }
        }
    }
    private func incrementPoints() {
        guard (points < 25 || abs(teamAPoints - teamBPoints) < 2) else { return }
        points += 1
    }
    
    private func decrementPoints() {
        if points > 0 {
            points -= 1
        }
    }
}
