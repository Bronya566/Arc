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
    private var questions: [Question] = []
    private var questionNumber = 0
    private var answerButtons: [UIButton] = []
    private var resultProgress = UILabel()
    private var resultQuestion = UILabel()
    private var gameSession: GameSessionDelegate?
    private var game: Game?
    private var queueStrategy: QueueSettingStrategyProtocol? {
        switch Game.shared.isRandomQueueSetting {
        case true:
            return RandomQueueSettingStrategy()
        case false:
            return SimpleQueueSettingStrategy()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        questions = queueStrategy?.getQuestions(from: Game.shared.questions) ?? []
        gameSession = GameSession()
        game = Game.shared
        game?.gameSession = gameSession as? GameSession
        view.backgroundColor = .white
        createTextResultProgress()
        view.addSubview(resultProgress)
        createTextResultQuestion()
        view.addSubview(resultQuestion)
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
    
    private func createTextResultProgress() {
        Game.shared.gameSession?.progress.addObserver(self, options: [.new, .initial], closure: {
            [weak self] (progress, _) in
            self?.resultProgress.text = "Прогресс игры \(progress)"
        })
    }
    
    private func createTextResultQuestion(){
        Game.shared.gameSession?.nowResult.addObserver(self, options: [.new, .initial], closure: {
            [weak self] (progress, _) in
            self?.resultQuestion.text = "Вопрос №  \(progress)"
        })
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
        guard questionNumber < questions.count else {
            self.willMove(toParent: nil)
            self.view.removeFromSuperview()
            self.removeFromParent()
            gameSession?.didEndGame(withResult: Result(questionsCount: questions.count, questionsSucsess: questionNumber))
            game?.gameEnd()
            game?.gameSession = nil
            return
        }
        game?.gameSession?.nowResult.value += 1
        game?.gameSession?.progress.value = Double(questionNumber * 100 / questions.count)
        questionsText.text = questions[questionNumber].text
        for (index, button) in answerButtons.enumerated() {
            button.setTitle(questions[questionNumber].variable[index], for: .normal)
        }
        }
    
    private func setupConstraints() {
        questionsText.translatesAutoresizingMaskIntoConstraints = false
        resultProgress.translatesAutoresizingMaskIntoConstraints = false
        resultQuestion.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resultProgress.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultProgress.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            
            resultQuestion.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultQuestion.topAnchor.constraint(equalTo: resultProgress.bottomAnchor, constant: 20),
            
            questionsText.topAnchor.constraint(equalTo: resultQuestion.bottomAnchor, constant: 20),
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
