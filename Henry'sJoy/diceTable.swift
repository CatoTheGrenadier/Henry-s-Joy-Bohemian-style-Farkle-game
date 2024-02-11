//
//  diceTable.swift
//  Henry'sJoy
//
//  Created by Yi Ling on 2/9/24.
//

import Foundation
import SwiftUI

struct diceTable: View {
    @ObservedObject var coreComponents = CoreGameComponent()
    var body: some View {
        VStack{
            if (coreComponents.round == 0){
                Text("Welcome to Sasau!")
                    .padding(100)
                Button("PLAY!"){
                    coreComponents.newGame()
                }
            }else{
                
                if (coreComponents.Henry.currentScore >= coreComponents.scoreToVictory){
                    Text("Henry is victorious!")
                    Button("Start Over"){
                        coreComponents.newGame()
                    }
                }else if (coreComponents.Gambler.currentScore >= coreComponents.scoreToVictory){
                    Text("Oh no! Henry lost!")
                    Button("Start Over"){
                        coreComponents.newGame()
                    }
                }else{
                    Button("Start New Game"){
                        coreComponents.newGame()
                    }
                    moneyAndRound(coreComponents: coreComponents)
                        .padding(20)
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
