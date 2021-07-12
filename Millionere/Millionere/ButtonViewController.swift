//
//  ButtonViewController.swift
//  Millionere
//
//  Created by Marcus on 12.07.2021.
//

import UIKit
import Foundation

class ButtonViewController: UIViewController {
    
    private var questionsText = UILabel()
    private let questions = TestQuestion.createQuestions()
    private var questionNumber = 0
    private var answerButtons: [UIButton] = []
    private var gameSession: GameSessionDelegate?
    private var game: Game?
    override func viewDidLoad() {
        super.viewDidLoad()
        gameSession = GameSession()
        game = Game.shared
        game?.gameSession = gameSession
        view.backgroundColor = .white
        createTextQuestionsLabel()
        view.addSubview(questionsText)
        createAnswerButton()
        answerButtons.forEach { btn in
            view.addSubview(btn)
        }
        setupConstraints()
    }
    
    private func createTextQuestionsLabel(){
        questionsText.text = questions[questionNumber].text
        questionsText.font = UIFont(name: "HelveticaNeue", size: 25)
        questionsText.lineBreakMode = .byWordWrapping
        questionsText.numberOfLines = 0
    }
    
    private func createAnswerButton() {
        for number in 0...3 {
            let button = UIButton(type: .custom)
            button.setTitle(questions[questionNumber].variable[number], for: .normal)
            button.backgroundColor = .yellow
            button.setTitleColor(.black, for: .normal)
            answerButtons.append(button)
            button.addTarget(self, action: #selector(tapAnswerButton), for: .touchDown)
        }
    }
    @objc func tapAnswerButton(button: UIButton) {
        guard questions[questionNumber].answer == button.titleLabel?.text else {
            self.willMove(toParent: nil)
            self.view.removeFromSuperview()
            self.removeFromParent()
            gameSession?.didEndGame(withResult: Result(questionsCount: questions.count, questionsSucsess: questionNumber))
            game?.gameEnd()
            game?.gameSession = nil
            return
        }
        questionNumber += 1
        guard questionNumber <= answerButtons.count && questionNumber <= questions.count else {
            self.willMove(toParent: nil)
            self.view.removeFromSuperview()
            self.removeFromParent()
            gameSession?.didEndGame(withResult: Result(questionsCount: questions.count, questionsSucsess: questionNumber))
            game?.gameEnd()
            game?.gameSession = nil
            return
        }
        questionsText.text = questions[questionNumber].text
        for (index, button) in answerButtons.enumerated() {
            button.setTitle(questions[questionNumber].variable[index], for: .normal)
        }
        }
    
    private func setupConstraints() {
        questionsText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            questionsText.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            questionsText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            questionsText.widthAnchor.constraint(equalToConstant: view.frame.size.width-20),
            questionsText.heightAnchor.constraint(equalToConstant: view.frame.size.height/4-20)
            
            
        ])
        
        for (index, button) in answerButtons.enumerated() {
            button.translatesAutoresizingMaskIntoConstraints = false
            if index == 0 {
                NSLayoutConstraint.activate([
                    button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    button.topAnchor.constraint(equalTo: questionsText.bottomAnchor, constant: 50),
                    button.heightAnchor.constraint(equalToConstant: 100),
                    button.widthAnchor.constraint(equalToConstant: 400),
                    
                     ])
            } else {
                NSLayoutConstraint.activate([
                    button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    button.topAnchor.constraint(equalTo: answerButtons[index-1].bottomAnchor, constant: 20),
                    button.heightAnchor.constraint(equalToConstant: 100),
                    button.widthAnchor.constraint(equalToConstant: 400),
                    
                     ])
            }
        }
    }
    

}
