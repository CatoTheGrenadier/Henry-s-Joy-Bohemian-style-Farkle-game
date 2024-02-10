//
//  CoreGameComponent.swift
//  Henry'sJoy
//
//  Created by Yi Ling on 2/9/24.
//

import Foundation
import SwiftUI

struct CoreGameComponent {
    var round: Int
    var turn: Int
    var scoreToVictory: Int
    var Henry: Player
    var Gambler: Player
    
    init(){
        round = 0
        turn = 0
        scoreToVictory = 4000
        Henry = Player()
        Gambler = Player()
    }
    
    mutating func NextRound (){
        round += 1
    }
    
    func PlayOn (){
        if (round % 2 != 0){
            rollDice(p:Henry)
        }else{
            aiPlay(p: Gambler)
        }
    }
    
    func rollDice(p:Player){
        let count =  6 - p.num_chosen
        p.currentThrow = generateRandomnumbers(count:count).reduce(into:[:]){counts, element in counts[element, default:0] += 1}
        p.leftOver = p.currentThrow
    }
    
    func choices(p:Player, victim:Int){
        p.leftOver[victim, default: 0] -= 1
        p.chosen[victim, default: 0] += 1
    }
    
    func stopAtNow(p:Player){
        
    }
    
    func aiPlay(p:Player){
        
    }
}

class Player{
    var name: String
    var currentThrow: [Int:Int]
    var chosen: [Int:Int]
    var leftOver: [Int:Int]
    var currentScore: Int
    var stackedScore: Int
    var num_left: Int
    var num_chosen: Int
    
    init() {
        self.name = "placeholder"
        self.currentThrow = [:]
        self.chosen = [:]
        self.leftOver = [:]
        self.currentScore = 0
        self.stackedScore = 0
        self.num_left = 6
        self.num_chosen = 0
    }
}

func generateRandomnumbers (count:Int) -> [Int] {
    return (0..<count).map { _ in
                Int.random(in: 1...6)
    }
}


