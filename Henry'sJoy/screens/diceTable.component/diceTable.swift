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
    
    var body: some View {
        VStack{
            if (coreComponents.round == 0){
                Button("PLAY"){
                    coreComponents.newGame()
                }
                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 30))
                .padding(10)
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
                    HStack(spacing:0){
                        Button("New Game"){
                            showAlert = true
                        }
                        .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
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
                        
                        Button(action:{
                            showAlertRules.toggle()
                        }){
                            Text("R")
                                .foregroundColor(Color.red)
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                            +
                            Text("ules")
                                .foregroundColor(Color.red)
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                        }
                        .padding()
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
                        
                        Button(action:{
                            showAlertAbout.toggle()
                        }){
                            Text("A")
                                .foregroundColor(Color.red)
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                            +
                            Text("bout")
                                .foregroundColor(Color.red)
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
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
                    }
                    .padding()
                    
                    Text("Round \((coreComponents.round - coreComponents.round % 2)/2 + 1)")
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
