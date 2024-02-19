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

    var body: some View {
        ZStack {
            HStack(spacing:0) {
                ZStack {
                    VStack(spacing: 0) {
                        Button(action: {
                            incrementTeamPoints(team: "A")
                        }) {
                            Color.red.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        }
                        Button(action: {
                            if teamAPoints > 0 {
                                teamAPoints -= 1
                            }
                        })
                        {
                            Color.red.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        }
                    }
                    Text("\(teamAPoints)")
                        .font(.system(size: UIScreen.main.bounds.width * 0.15))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                }
                ZStack{
                    VStack(spacing: 0) {
                        Button(action: {
                            incrementTeamPoints(team: "B")
                        }) {
                            Color.blue.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        }
                        Button(action: {
                            if teamBPoints > 0 {
                                teamBPoints -= 1
                            }
                        }) {
                            Color.blue.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    Text("\(teamBPoints)")
                        .font(.system(size: UIScreen.main.bounds.width * 0.15))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                }
            }
            if isWinner {
                Button(action: {
                    teamAPoints = 0
                    teamBPoints = 0
                    isWinner = false
                }) {
                    Text("Team \(teamAPoints > teamBPoints ? "A" : "B") wins!")
                        .font(.system(size: UIScreen.main.bounds.width * 0.03))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                }
            } else {
                Button(action: {
                    teamAPoints = 0
                    teamBPoints = 0
                    isWinner = false
                }) {
                    Text("Reset")
                        .font(.system(size: UIScreen.main.bounds.width * 0.03))
                        .foregroundColor(.white)
                        .padding(35)
                        .background(Color.black)
                        .clipShape(Circle())
                    }
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
}
#Preview {
    ContentView()
}
