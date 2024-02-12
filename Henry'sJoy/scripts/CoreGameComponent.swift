//  CoreGameComponent.swift
//  Henry'sJoy
//
//  Created by Yi Ling on 2/9/24.
//

import Foundation
import SwiftUI

class CoreGameComponent: ObservableObject {
    @Published var round: Int
    @Published var turn: Int
    @Published var scoreToVictory: Int
    @Published var diceMap: [Int:String]
    @Published var diceImageMap: [Int:String]
    @Published var Henry: Player
    @Published var Gambler: Player
    @Published var state = 0
    @Published var displayRound = 0
    
    init(){
        round = 0
        turn = 0
        scoreToVictory = 4000
        diceMap = [1:"⚀", 2:"⚁", 3:"⚂", 4:"⚃", 5: "⚄", 6:"⚅"]
        diceImageMap = [1:"Dice1",2:"Dice2", 3:"Dice3", 4:"Dice4",5:"Dice5",6:"Dice6"]
        Henry = Player(name:"Henry")
        Gambler = Player(name:"Gambler")
    }
    
    func updateDisplayRound(){
        if round % 2 == 1{
            displayRound = (round + 1) / 2
        }else{
            displayRound = round / 2
        }
    }

    func newGame(){
        round = 1
        turn = 0
        scoreToVictory = 4000
        Henry = Player(name:"Henry")
        Gambler = Player(name:"Gambler")
        updateDisplayRound()
    }
    
    func NextRound (p:Player){
        p.turn = 0
        p.currentThrow = [:]
        p.chosen = [:]
        p.tempChosen = [:]
        p.leftOver = [:]
        p.currentStackedScore = 0
        p.stackedScore = 0
        p.num_chosen = 0
        p.num_tempChosen = 0
        p.difficulty = 14 - p.difficultyInit
        round += 1
        updateDisplayRound()
    }
    
    func rollDice(p:Player){
        if p.num_chosen == 6{
            p.num_chosen = 0
            p.chosen = [:]
        }
        let count =  6 - p.num_chosen
        p.currentThrow = generateRandomnumbers(count:count).reduce(into:[:]){counts, element in counts[element, default:0] += 1}
        p.leftOver = [:]
        for (key,value) in p.currentThrow{
            p.leftOver[key, default: 0] = value
        }
        p.currentStackedScore = 0
        p.turn += 1
        p.tempChosen = [:]
    }
    
    func choose(p:Player, victim:Int){
        if (p.leftOver[victim,default: 0] <= 1){
            p.leftOver.removeValue(forKey: victim)
        }else{
            p.leftOver[victim,default: 0] -= 1
        }
        
        if p.tempChosen.keys.contains(victim){
            p.tempChosen[victim,default: 0] += 1
        }else{
            p.tempChosen[victim,default: 0] = 1
        }
        p.num_tempChosen += 1
        p.currentStackedScore = getScore(match: p.tempChosen)
    }
    
    func dechoose(p:Player, victim:Int){
        if (p.tempChosen[victim,default: 0] <= 1){
            p.tempChosen.removeValue(forKey: victim)
        }else{
            p.tempChosen[victim,default: 0] -= 1
        }
        
        if p.leftOver.keys.contains(victim){
            p.leftOver[victim,default: 0] += 1
        }else{
            p.leftOver[victim,default: 0] = 1
        }
        p.num_tempChosen -= 1
        p.currentStackedScore = getScore(match: p.tempChosen)
    }
    
    func stackScore(p:Player){
        for (key,value) in p.tempChosen{
            if p.chosen.keys.contains(key){
                p.chosen[key,default: 0] += value
                p.num_chosen += value
            }else{
                p.chosen[key,default: 0] = value
                p.num_chosen += value
            }
        }
        
        p.num_tempChosen = 0
        p.stackedScore += getScore(match: p.tempChosen)
        p.tempChosen = [:]
    }
    
    func farkleScore(p:Player){
        p.currentScore += p.stackedScore
        p.stackedScore = 0
        NextRound(p:p)
    }
    
    func aiPlay(p:Player){
        NextRound(p: p)
    }
    
    func judgeIfLegal(match:[Int:Int]) -> Bool {
        for (key, value) in match{
            if (key != 1 && key != 5 && value <= 2){
                return false
            }
        }
        return true
    }
    
    func ScrapTheBowl(p:Player){
        p.tempChosen = [:]
        p.num_tempChosen = 0
        for (key, value) in p.currentThrow{
            if (key == 1){
                p.tempChosen[key,default: 0] = value
                p.leftOver.removeValue(forKey: key)
                p.num_tempChosen += value
                p.difficulty -= value
                
            }else if (key == 5){
                p.tempChosen[key,default: 0] = value
                p.leftOver.removeValue(forKey: key)
                p.num_tempChosen += value
                p.difficulty -= value
            }else{
                if (value >= 3){
                    p.tempChosen[key,default: 0] = value
                    p.leftOver.removeValue(forKey: key)
                    p.num_tempChosen += value
                    p.difficulty -= value
                }
            }
        }
        if p.difficulty == 1{
            p.difficulty = p.difficultyInit
        }
        p.currentStackedScore = getScore(match: p.tempChosen)
    }
    
    func getScore(match:[Int:Int]) -> Int {
        var score = 0
        for (key, value) in match{
            if (key == 1){
                if (value <= 2){
                    score += 100 * value
                }else{
                    score += 1000 * (value - 2)
                }
            }else if (key == 5){
                if (value <= 2){
                    score += 50 * value
                }else{
                    score += 500 * (value - 2)
                }
            }else{
                if (value >= 3){
                    score += key * 100 * (value - 2)
                }
            }
        }
        return score
    }
}

class Player{
    @Published var name: String
    @Published var currentThrow: [Int:Int]
    @Published var chosen: [Int:Int]
    @Published var leftOver: [Int:Int]
    @Published var tempChosen: [Int:Int]
    @Published var currentScore: Int
    @Published var stackedScore: Int
    @Published var num_left: Int
    @Published var num_chosen: Int
    @Published var currentStackedScore: Int
    @Published var turn: Int
    @Published var num_tempChosen: Int
    @Published var difficulty: Int
    @Published var difficultyInit: Int
    @Published var difficultyMap: [Int:String]
    
    init(name:String) {
        self.name = name
        self.currentThrow = [:]
        self.chosen = [:]
        self.leftOver = [:]
        self.tempChosen = [:]
        self.currentScore = 0
        self.stackedScore = 0
        self.num_left = 6
        self.num_chosen = 0
        self.turn = 0
        self.currentStackedScore = 0
        self.num_tempChosen = 0
        self.difficulty = 7
        self.difficultyInit = 7
        self.difficultyMap = [5:"Hard",7:"Normal",9:"Easy"]
    }
}

func generateRandomnumbers (count:Int) -> [Int] {
    return (0..<count).map { _ in
                Int.random(in: 1...6)
    }
}
