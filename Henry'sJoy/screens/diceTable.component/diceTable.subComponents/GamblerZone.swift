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
        Text("Selected :  \(coreComponents.Gambler.currentStackedScore)")
            .id(dummy)
            .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
        
        Text("Stacked :  \(coreComponents.Gambler.stackedScore)")
            .id(dummy)
            .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
        
        Text("Total :  \(coreComponents.Gambler.currentScore)")
            .id(dummy)
            .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
        
        let possibleScore = coreComponents.getScore(match: coreComponents.Gambler.currentThrow)
        
        let posScore = coreComponents.getScore(match: coreComponents.Gambler.leftOver)
        
        if (coreComponents.round % 2 == 0 && (coreComponents.Gambler.turn == 0 || possibleScore > 0 || coreComponents.Gambler.currentStackedScore > 0) ){
            VStack{
                if (coreComponents.Gambler.turn == 0){
                    Text("Gambler is going to throw!")
                        .padding(10)
                        .foregroundColor(Color.red)
                        .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                        .onAppear(){
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                coreComponents.rollDice(p: coreComponents.Gambler)
                                dummy.toggle()
                            }
                        }
                }else{
                    if posScore == 0 {
                            
                        let randomToken = Int.random(in: 1...10)
                        
                        if (randomToken <= coreComponents.Gambler.difficulty){
                            Text("Gambler decided to take risk!")
                                .padding(10)
                                .foregroundColor(Color.red)
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                                .onAppear(){
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                        coreComponents.stackScore(p: coreComponents.Gambler)
                                        coreComponents.rollDice(p: coreComponents.Gambler)
                                        dummy.toggle()
                                    }
                                }
                        }else{
                            Text("Gambler decided to stop here!")
                                .padding(10)
                                .foregroundColor(Color.red)
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
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
                            .padding(10)
                            .foregroundColor(Color.red)
                            .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                            .onAppear(){
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                    coreComponents.ScrapTheBowl(p: coreComponents.Gambler)
                                    dummy.toggle()
                                }
                            }
                    }
                }
                
                HStack{
                    if coreComponents.Gambler.num_chosen == 0{
                        Button(""){}
                            .font(.system(size: 50))
                            .padding(10)
                    }else{
                        ForEach(Array(coreComponents.Gambler.chosen), id:\.key){ key, value in
                            if (value >= 1){
                                ForEach(0..<value, id: \.self){index in
                                    
                                    let die_3 = coreComponents.diceImageMap[key] ?? "default"
                                    
                                    Image(die_3)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 25, height: 25)
                                        .padding(10)
                                }
                            }
                        }
                    }
                }
                .padding(10)
                
                HStack{
                    if coreComponents.Gambler.num_tempChosen == 0{
                        Button(""){}
                            .font(.system(size: 50))
                            .padding(10)
                    }else{
                        ForEach(Array(coreComponents.Gambler.tempChosen), id:\.key){ key, value in
                            
                            if (value >= 1){
                                ForEach(0..<value, id: \.self){index in
                                    
                                    let die_2 = coreComponents.diceImageMap[key] ?? "default"
                                    
                                    Image(die_2)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 25, height: 25)
                                        .padding(10)
                                }
                            }
                        }
                    }
                }
                .padding(10)
                
                HStack{
                    ForEach(Array(coreComponents.Gambler.leftOver), id:\.key){ key, value in
                        if (value >= 1){
                            ForEach(0..<value, id: \.self){index in
                                
                                let die_1 = coreComponents.diceImageMap[key] ?? "default"
                                
                                Image(die_1)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                    .padding(10)
                            }
                        }
                    }
                }
                
            }
        }else if (possibleScore == 0 && coreComponents.round % 2 == 0){
            VStack{
                HStack{
                    Button(""){}
                        .font(.system(size: 50))
                        .padding(10)
                    ForEach(Array(coreComponents.Gambler.currentThrow), id:\.key){ key, value in
                        if (value >= 1){
                            ForEach(0..<value, id: \.self){index in
                                
                                let die_4 = coreComponents.diceImageMap[key] ?? "default"
                                
                                Image(die_4)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                    .padding(10)
                            }
                        }
                    }
                }
                Button(" "){}
                    .font(.system(size: 50))
                    .padding(10)
                Button(" "){}
                    .font(.system(size: 50))
            }
            Text("Gambler messed up!")
                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                .foregroundColor(Color.red)
            Text("It's Henry's turn now!")
                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                .foregroundColor(Color.red)
                .onAppear(){
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        coreComponents.NextRound(p:coreComponents.Gambler)
                    }
                }
        }
        
    }
}

#Preview {
    farkleGame()
}
