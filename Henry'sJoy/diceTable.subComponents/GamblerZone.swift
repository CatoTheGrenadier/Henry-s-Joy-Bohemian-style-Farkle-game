//  Gambler Zone.swift
//  Henry'sJoy
//
//  Created by Yi Ling on 2/10/24.
//

import Foundation
import SwiftUI

struct GamblerZone: View {
    @ObservedObject var coreComponents: CoreGameComponent
    @State private var dummy: Bool = false
    @State private var isProcessing: Bool = false

    
    var body: some View {
        Text("currentStackedScore:\(coreComponents.Gambler.currentStackedScore)")
            .id(dummy)

        Text("stackedScore:\(coreComponents.Gambler.stackedScore)")
            .id(dummy)
        
        Text("TotalScore:\(coreComponents.Gambler.currentScore)")
            .id(dummy)
        
        let possibleScore = coreComponents.getScore(match: coreComponents.Gambler.currentThrow)
        
        let posScore = coreComponents.getScore(match: coreComponents.Gambler.leftOver)
        
        if (coreComponents.round % 2 == 0 && (coreComponents.Gambler.turn == 0 || possibleScore > 0 || coreComponents.Gambler.currentStackedScore > 0) ){
            VStack{
                if (coreComponents.Gambler.turn == 0){
                    Text("Gambler is going to throw!")
                        .onAppear(){
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                coreComponents.rollDice(p: coreComponents.Gambler)
                                dummy.toggle()
                            }
                        }
                }else{
                    if posScore == 0 {
                            
                        let randomToken = Int.random(in: 1...10)
                            
                        if (randomToken <= 7){
                            Text("Gambler decided to take risk!")
                                .onAppear(){
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                        coreComponents.stackScore(p: coreComponents.Gambler)
                                        coreComponents.rollDice(p: coreComponents.Gambler)
                                        dummy.toggle()
                                    }
                                }
                        }else{
                            Text("Gambler decided to stop here!")
                                .onAppear(){
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                        coreComponents.stackScore(p: coreComponents.Gambler)
                                        coreComponents.farkleScore(p: coreComponents.Gambler)
                                        dummy.toggle()
                                    }
                                }
                        }
                    }else{
                        Text("Gambler came up with a strategy!")
                            .onAppear(){
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                    coreComponents.ScrapTheBowl(p: coreComponents.Gambler)
                                    dummy.toggle()
                                }
                            }
                    }
                }
                
                HStack{
                    ForEach(Array(coreComponents.Gambler.leftOver), id:\.key){ key, value in
                        if (value >= 1){
                            ForEach(0..<value, id: \.self){index in
                                Text("\(key)")
                            }
                        }
                    }
                }
                .padding(50)
                
                HStack{
                    ForEach(Array(coreComponents.Gambler.tempChosen), id:\.key){ key, value in
                        
                        if (value >= 1){
                            ForEach(0..<value, id: \.self){index in
                                Text("\(key)")
                            }
                        }
                    }
                }
                .padding(50)
                
                HStack{
                    ForEach(Array(coreComponents.Gambler.chosen), id:\.key){ key, value in
                        if (value >= 1){
                            ForEach(0..<value, id: \.self){index in
                                Text("\(key)")
                            }
                        }
                    }
                }
                
            }
        }else if (possibleScore == 0 && coreComponents.round % 2 == 0){
            HStack{
                ForEach(Array(coreComponents.Gambler.currentThrow), id:\.key){ key, value in
                    if (value >= 1){
                        ForEach(0..<value, id: \.self){index in
                            Text("\(key)")
                        }
                    }
                }
            }
            Text("Oh no! Gambler messed up!")
            Button("Let Henry play"){
                coreComponents.NextRound(p:coreComponents.Gambler)
            }
        }
        
    }
}

#Preview {
    farkleGame()
}
