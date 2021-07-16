//
//  Game.swift
//  Millionere
//
//  Created by Marcus on 12.07.2021.
//
import UIKit
import Foundation

protocol GameSessionDelegate {
    var result: Result? { get set }
    func didEndGame(withResult result: Result)
}

class Game {
    static var shared: Game = {
        let go = Game()
        return go
    }()
    private(set) var results: [Result] = []
    var gameSession: GameSession?
    var isRandomQueueSetting = false
    var questions: [Question] = TestQuestion.createQuestions()
    private init(){}
    
    func gameEnd() {
        results.append(gameSession?.result ?? Result(questionsCount: 0, questionsSucsess: 0))
    }
}

class GameSession: GameSessionDelegate {
    var result: Result?
    var nowResult = Observable<Int>(1)
    var progress = Observable<Double>(0)
    
    func didEndGame(withResult result: Result) {
        self.result = result
    }
}


