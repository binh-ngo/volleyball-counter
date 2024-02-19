//
//  ContentView.swift
//  volleyball-counter
//
//  Created by Binh Ngo on 2/19/24.
//

import SwiftUI

struct ContentView: View {
    @State private var teamAPoints = 0
    @State private var teamBPoints = 0
    @State private var isWinner = false
    
    private let mdTextSize = UIScreen.main.bounds.width * 0.15
    private let smTextSize = UIScreen.main.bounds.width * 0.03
    
    var body: some View {
        ZStack {
            HStack(spacing:0) {
                TeamCounter(points: $teamAPoints, teamAPoints: $teamAPoints, teamBPoints: $teamBPoints, color: .red)
              TeamCounter(points: $teamBPoints, teamAPoints: $teamAPoints, teamBPoints: $teamBPoints, color: .blue)
            }
            if isWinner {
                WinnerButton(team: teamAPoints > teamBPoints ? "A" : "B", action: resetGame)
            } else {
                ResetButton(action: resetGame)
            }
        }
                .onChange(of: teamAPoints) {
                   checkWinner()
                   }
               .onChange(of: teamBPoints) {
                   checkWinner()
                   
                    }
            }
    
    private func incrementTeamPoints(team: String) {
        if (team == "A" && (teamAPoints < 25 || abs(teamAPoints - teamBPoints) <= 1)) ||
           (team == "B" && (teamBPoints < 25 || abs(teamAPoints - teamBPoints) <= 1)) {
            if team == "A" {
                teamAPoints += 1
            } else {
                teamBPoints += 1
            }
        }
    }
    
    private func checkWinner() {
        if teamAPoints >= 25 && teamAPoints >= teamBPoints + 2 {
            isWinner = true
        } else if teamBPoints >= 25 && teamBPoints >= teamAPoints + 2 {
            isWinner = true
        } else {
            isWinner = false
        }
    }

    private func resetGame() {
          teamAPoints = 0
          teamBPoints = 0
          isWinner = false
      }
  }


#Preview {
    ContentView()
}
