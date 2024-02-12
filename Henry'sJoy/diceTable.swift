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
    var body: some View {
        VStack{
            if (coreComponents.round == 0){
                Button("PLAY"){
                    coreComponents.newGame()
                }
                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 30))
            }else{
                
                if (coreComponents.Henry.currentScore >= coreComponents.scoreToVictory){
                    Text("Henry is victorious!")
                        .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                    Button("Start Over"){
                        coreComponents.newGame()
                    }
                    .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                }else if (coreComponents.Gambler.currentScore >= coreComponents.scoreToVictory){
                    Text("Oh no! Henry lost!")
                        .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                    Button("Start Over"){
                        coreComponents.newGame()
                    }
                    .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                }else{
                    HStack{
                        Text("Round \((coreComponents.round - coreComponents.round % 2)/2 + 1)")
                            .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                            .padding(30)
                        
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
                    }
                    
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
