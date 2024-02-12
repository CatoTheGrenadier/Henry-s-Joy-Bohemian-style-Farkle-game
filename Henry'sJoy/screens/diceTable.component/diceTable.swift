//
//  diceTable.swift
//  Henry'sJoy
//
//  Created by Yi Ling on 2/9/24.
//

import Foundation
import SwiftUI

struct diceTable: View {
    @ObservedObject var coreComponents:CoreGameComponent
    @State private var showAlert = false
    @State private var showAlertRules = false
    @State private var showAlertAbout = false
    @State var try1 = 0
    
    var body: some View {
        VStack{
            if (coreComponents.round == 0){
                Button("||  PLAY  ||"){
                    coreComponents.newGame()
                }
                .foregroundColor(Color.black)
                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 30))
                .padding(5)
            }else{
                
                if (coreComponents.Henry.currentScore >= coreComponents.scoreToVictory){
                    Text("Henry is victorious!")
                        .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                        .foregroundColor(Color.red)
                        .padding()
                    Button("Start Over"){
                        coreComponents.newGame()
                    }
                    .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                }else if (coreComponents.Gambler.currentScore >= coreComponents.scoreToVictory){
                    Text("Oh no! Henry lost!")
                        .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                        .foregroundColor(Color.red)
                        .padding()
                    Button("Start Over"){
                        coreComponents.newGame()
                    }
                    .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                }else{
                    VStack(spacing:0){
                        HStack(spacing:0){
                            Text("||")
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                            
                            Button(action:{
                                showAlert.toggle()
                            }){
                                Text(" N")
                                    .foregroundColor(Color.red)
                                    .font(Font.custom("Maximilian", size: 20))
                                +
                                Text("ew  ")
                                    .foregroundColor(Color.black)
                                    .font(Font.custom("Maximilian", size: 20))
                                +
                                Text("G")
                                    .foregroundColor(Color.red)
                                    .font(Font.custom("Maximilian", size: 20))
                                +
                                Text("ame")
                                    .foregroundColor(Color.black)
                                    .font(Font.custom("Maximilian", size: 20))
                            }
                            .alert(isPresented: $showAlert){
                                Alert(title: Text("Start Over"),
                                      message: Text("Do you want to start over?"),
                                      primaryButton: .default(Text("Yes")){
                                    coreComponents.newGame()
                                    coreComponents.round = 0
                                },
                                      secondaryButton: .cancel()
                                )
                            }
                            .padding()
                            
                            Text("||")
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                            
                            Button(action:{
                                showAlertRules.toggle()
                            }){
                                Text("R")
                                    .foregroundColor(Color.red)
                                    .font(Font.custom("Maximilian", size: 20))
                                +
                                Text("ules   ")
                                    .foregroundColor(Color.black)
                                    .font(Font.custom("Maximilian", size: 20))
                            }
                            .alert(isPresented: $showAlertRules){
                                Alert(title: Text("Rules"),
                                      message: Text("Do you want to read the rules?"),
                                      primaryButton: .default(Text("Yes")){
                                    coreComponents.newGame()
                                    coreComponents.round = 0
                                    coreComponents.state = 1
                                },
                                      secondaryButton: .cancel()
                                )
                            }
                            
                            Text("||")
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                            
                            Button(action:{
                                showAlertAbout.toggle()
                            }){
                                Text("A")
                                    .foregroundColor(Color.red)
                                    .font(Font.custom("Maximilian", size: 20))
                                +
                                Text("bout    ")
                                    .foregroundColor(Color.black)
                                    .font(Font.custom("Maximilian", size: 20))
                            }
                            .alert(isPresented: $showAlertAbout){
                                Alert(title: Text("About"),
                                      message: Text("Do you want to checkout the profile of author?"),
                                      primaryButton: .default(Text("Yes")){
                                    coreComponents.newGame()
                                    coreComponents.round = 0
                                    coreComponents.state = 2
                                },
                                      secondaryButton: .cancel()
                                )
                            }
                            
                            Text("||")
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                        }
                        
                        let difficulty = coreComponents.Gambler.difficultyMap[14 - coreComponents.Gambler.difficultyInit] ?? "default"
                        
                        HStack{
                            Text("Difficulty : ")
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                            if difficulty == "Easy"{
                                Text("Easy")
                                    .foregroundColor(Color.green)
                                    .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                            }else if difficulty == "Normal"{
                                Text("Normal")
                                    .foregroundColor(Color.yellow)
                                    .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                            }else{
                                Text("Hard")
                                    .foregroundColor(Color.red)
                                    .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                            }
                            
                            Stepper("",value:$coreComponents.Gambler.difficultyInit, in:5...9, step:2)
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                        }        
                        .padding(.horizontal, 45)
                    }
                    Text("Round \(coreComponents.displayRound)")
                            .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                        
                    Text("-----------------------------------")
                        .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                    
                    GamblerZone(coreComponents: coreComponents)
                    Spacer()
                    HenryZone(coreComponents:coreComponents)
                }
            }
        }
        .padding(5.0)
        
    }
}

#Preview {
    farkleGame()
}
