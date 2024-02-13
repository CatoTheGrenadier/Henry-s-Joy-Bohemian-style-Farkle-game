//  Gambler Zone.swift
//  Henry'sJoy
//
//  Created by Yi Ling on 2/10/24.
//

import Foundation
import SwiftUI

struct HenryZone: View {
    @ObservedObject var coreComponents: CoreGameComponent
    @State private var dummy: Bool = false
    @State private var isProcessing: Bool = false

    
    var body: some View {
        let possibleScore = coreComponents.getScore(match: coreComponents.Henry.currentThrow)
        
        if (coreComponents.round % 2 == 1 && (coreComponents.Henry.turn == 0 || possibleScore > 0 || coreComponents.Henry.currentStackedScore > 0) ){
            VStack{
                HStack{
                    
                    ForEach(Array(coreComponents.Henry.leftOver), id:\.key){ key, value in
                        if (value >= 1){
                            ForEach(0..<value, id: \.self){index in
                                
                                let die_1 = coreComponents.diceImageMap[key] ?? "default"
                                
                                Button(action:{
                                    if !isProcessing{
                                        
                                        isProcessing = true
                                        
                                        coreComponents.choose(p: coreComponents.Henry, victim: key)
                                        
                                        isProcessing = false
                                    }
                                    dummy.toggle()
                                }){
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
                .padding(10)
                
                HStack{
                    
                    if coreComponents.Henry.num_tempChosen == 0{
                        Button(" "){}
                            .font(.system(size:50))
                            .padding(10)
                    }else{
                        ForEach(Array(coreComponents.Henry.tempChosen), id:\.key){ key, value in
                            
                            if (value >= 1){
                                ForEach(0..<value, id: \.self){index in
                                    
                                    let die_2 = coreComponents.diceImageMap[key] ?? "default"
                                    
                                    Button(action:{
                                        if !isProcessing{
                                            isProcessing = true
                                            
                                            coreComponents.dechoose(p: coreComponents.Henry, victim: key)
                                            
                                            isProcessing = false
                                        }
                                        dummy.toggle()
                                    }){
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
                    
                }
                .padding(10)
                
                HStack{
                    
                    if coreComponents.Henry.num_chosen == 0{
                        Button(""){}
                            .font(.system(size:50))
                            .padding(10)
                    }else{
                        ForEach(Array(coreComponents.Henry.chosen), id:\.key){ key, value in
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
                
                if (coreComponents.Henry.turn == 0){
                    Button(action:{
                        coreComponents.rollDice(p: coreComponents.Henry)
                        dummy.toggle()
                    }){
                        HStack{
                            Text("|| ")
                                .foregroundColor(Color.black)
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 30))
                            
                            Image("Roll")
                            
                            Text("R")
                                .foregroundColor(Color.red)
                                .font(Font.custom("Maximilian", size: 30))
                            +
                            Text("oll ")
                                .foregroundColor(Color.black)
                                .font(Font.custom("Maximilian", size: 30))
                            +
                            Text("D")
                                .foregroundColor(Color.red)
                                .font(Font.custom("Maximilian", size: 30))
                            +
                            Text("ice")
                                .foregroundColor(Color.black)
                                .font(Font.custom("Maximilian", size: 30))
                            
                            Text(" ||")
                                .foregroundColor(Color.black)
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 30))
                        }
                    }
                    .padding(10)
                }else{
                    
                    if (coreComponents.judgeIfLegal(match: coreComponents.Henry.tempChosen) && coreComponents.Henry.num_tempChosen >= 1){
                        
                        HStack{
                            Text("||")
                                .foregroundColor(Color.black)
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 30))
                            Button(action:{
                                coreComponents.stackScore(p: coreComponents.Henry)
                                coreComponents.rollDice(p: coreComponents.Henry)
                                dummy.toggle()
                                
                            }){
                                HStack{
                                    
                                    Text("T")
                                        .foregroundColor(Color.red)
                                        .font(Font.custom("Maximilian", size: 25))
                                    +
                                    Text("hrow ")
                                        .foregroundColor(Color.black)
                                        .font(Font.custom("Maximilian", size: 25))
                                    +
                                    Text("A")
                                        .foregroundColor(Color.red)
                                        .font(Font.custom("Maximilian", size: 25))
                                    +
                                    Text("gain")
                                        .foregroundColor(Color.black)
                                        .font(Font.custom("Maximilian", size: 25))
                                }
                            }
                            
                            Text("||")
                                .foregroundColor(Color.black)
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 30))
                            
                            Button(action:{
                                coreComponents.stackScore(p: coreComponents.Henry)
                                coreComponents.farkleScore(p: coreComponents.Henry)
                                dummy.toggle()
                                
                            }){
                                HStack{
                                    Text(" F")
                                        .foregroundColor(Color.red)
                                        .font(Font.custom("Maximilian", size: 25))
                                    +
                                    Text("arkle    ")
                                        .foregroundColor(Color.black)
                                        .font(Font.custom("Maximilian", size: 25))
                                }
                            }
                            
                            Text("||")
                                .foregroundColor(Color.black)
                                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 30))
                        }
                    }else if (coreComponents.Henry.num_tempChosen < 1){
                        Text("You need to choose at least one dice!")
                            .foregroundColor(Color.red)
                            .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                            .padding(10)
                    }else{
                        Text("That doesn't work!")
                            .foregroundColor(Color.red)
                            .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                            .padding(10)
                    }
                }
                
            }
        }else if (possibleScore == 0 && coreComponents.round % 2 == 1){
            VStack{
                HStack{
                    ForEach(Array(coreComponents.Henry.currentThrow), id:\.key){ key, value in
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
            Text("Oh no! Henry messed up!")
                .foregroundColor(Color.red)
                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
            Text("It's Gamble's turn now!")
                .foregroundColor(Color.red)
                .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                .onAppear(){
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        coreComponents.NextRound(p:coreComponents.Henry)
                    }
                }
        }
        
        HStack{
            if coreComponents.round % 2 == 1{
                Text(coreComponents.Henry.name)
                    .foregroundColor(Color.red)
                    .font(Font.custom("Maximilian", size: 40))
                    .padding(40)
            }else{
                Text(coreComponents.Henry.name)
                    .font(Font.custom("Maximilian", size: 25))
                    .padding(40)
            }
            VStack{
                
                Text("Selected :  \(coreComponents.Henry.currentStackedScore)")
                    .id(dummy)
                    .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                
                Text("Stacked :  \(coreComponents.Henry.stackedScore)")
                    .id(dummy)
                    .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
                
                Text("Total :  \(coreComponents.Henry.currentScore)")
                    .id(dummy)
                    .font(Font.custom("1529 Champ Fleury W01 Regular", size: 20))
            }
        }
    }
}

#Preview {
    farkleGame()
}
