//
//  Rules.swift
//  Henry'sJoy
//
//  Created by Yi Ling on 2/11/24.
//

import SwiftUI

struct Rules: View {
    @ObservedObject var coreComponents:CoreGameComponent
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing:0){
            ScrollView{
                VStack{
                    HStack(spacing:0){
                        Text("S")
                            .foregroundColor(Color.red)
                            .font(Font.custom("Maximilian", size: 70))
                            .multilineTextAlignment(.leading)
                        Text("coring")
                            .font(Font.custom("Maximilian", size: 40))
                            .multilineTextAlignment(.leading)
                    }
                    .padding(1)
                    
                    VStack(alignment:.leading){
                        HStack(spacing:0){
                            Text("⚀")
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 35))
                            Text("  is worth 100 points;")
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                        }
                        
                        HStack(spacing:0){
                            Text("⚄")
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 35))
                            Text("  is worth 50 points;")
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                        }
                        
                        Text("Three of a kind is worth 100 points multiplied by the given number.")
                            .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                        
                        HStack(spacing:0){
                            Text("e.g. ")
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                            Text("⚃⚃⚃")
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 35))
                            Text("  is worth 400 points;")
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                        }
                        
                        HStack(spacing:0){
                            Text("⚀⚀⚀")
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 35))
                            Text("  is worth 1000 points;")
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                        }
                        
                        Text("Four or more of a kind is worth double the points of three of a kind.")
                            .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                        
                        HStack(spacing:0){
                            Text("So ")
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                            Text("⚃⚃⚃⚃")
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 35))
                            Text("  is worth 800 points,")
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                        }
                        
                        HStack(spacing:0){
                            Text("⚃⚃⚃⚃⚃")
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 35))
                            +
                            Text("  is worth 1600 points, etc.")
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                        }
                    }
                    .padding(1)
                }
                .padding()
                
                VStack{
                    HStack(spacing:0){
                        Text("G")
                            .foregroundColor(Color.red)
                            .font(Font.custom("Maximilian", size: 70))
                            .multilineTextAlignment(.leading)
                        Text("ameplay")
                            .font(Font.custom("Maximilian", size: 40))
                            .multilineTextAlignment(.leading)
                    }
                    .padding(1)
                    
                    Text("A player's turn always begins by throwing all six dice. The player then has to select and set aside scoring dice, and at least one die must always be set aside. Then the player can throw the remaining dice again and the situation repeats. Scoring combinations are counted for present throw, not the entire turn. The key element of the game is that if a throw does not produce a single scoring die, then the player's turn is over and all points gained up to that point during the turn are lost. It is then the opposing player's turn to throw.Therefore, it is advisable to end your turn before there is a significant increase in the chance that not a single die will score. It is also often worth not setting aside all scoring dice so that you will have a better chance of scoring higher on the next throw.")
                        .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                        .padding()
                }
                
                VStack{
                    HStack(spacing:0){
                        Text("A")
                            .foregroundColor(Color.red)
                            .font(Font.custom("Maximilian", size: 70))
                            .multilineTextAlignment(.leading)
                        
                        Text("bout ")
                            .font(Font.custom("Maximilian", size: 40))
                            .multilineTextAlignment(.leading)
                        
                        Text("G")
                            .foregroundColor(Color.red)
                            .font(Font.custom("Maximilian", size: 70))
                            .multilineTextAlignment(.leading)
                        
                        Text("ame")
                            .font(Font.custom("Maximilian", size: 40))
                            .multilineTextAlignment(.leading)
                    }
                    .padding(1)
                    
                    Text("The original game of farkle is said to have been first played in Iceland by Sir Albert Farkle in the 14th century. Since then, it has been played in a few different styles, but the original game has survived for over 700 years. The goal of this two-player is to be the first to reach a certain number of points. Six dice are thrown and the players alternate turns. Points are gained for every one or five thrown, and for three or more of a kind of any other numbers. Before starting the game, both players must set the target number of points to be achieved (usually 2000, 3000 or 5000 points). For a better overview, it is a good idea to write the number of points you have accumulated so far after each round.")
                        .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                        .padding()
                 }
            }
            .padding(15)
            Button("Back to Main Screen"){
                coreComponents.state = 0
                presentationMode.wrappedValue.dismiss()
            }
            .font(Font.custom("1529 Champ Fleury W01 Regular", size: 30))
            .foregroundColor(Color.black)
        }
    }
}

#Preview {
    farkleGame()
}
