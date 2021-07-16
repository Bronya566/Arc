//
//  NewQuestion.swift
//  Millionere
//
//  Created by Marcus on 16.07.2021.
//

import Foundation
import UIKit

class NewQuestion: UIViewController {
    private var questionField = UITextField()
    private var secondAnswer = UITextField()
    private var firstAnswer = UITextField()
    private var thirdAnswer = UITextField()
    private var fourthAnswer = UITextField()
    private var newQuestionButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createQuestionField()
        view.addSubview(questionField)
        createSecondAnswer()
        view.addSubview(secondAnswer)
        createFirstAnswer()
        view.addSubview(firstAnswer)
        createThirdAnswer()
        view.addSubview(thirdAnswer)
        createFourthAnswer()
        view.addSubview(fourthAnswer)
        createNewQuestionButton()
        view.addSubview(newQuestionButton)
        setupConstraints()
    }
    
    private func createQuestionField() {
        questionField.backgroundColor = .white
        questionField.placeholder = "Введите вопрос"
        questionField.font = questionField.font?.withSize(20.0)
        questionField.borderStyle = UITextField.BorderStyle.line
        questionField.textAlignment = .center
    }
    private func createSecondAnswer() {
        secondAnswer.backgroundColor = .white
        secondAnswer.placeholder = "Введите вариант ответа "
        secondAnswer.font = secondAnswer.font?.withSize(20.0)
        secondAnswer.borderStyle = UITextField.BorderStyle.line
        secondAnswer.textAlignment = .center
    }
    private func createFirstAnswer() {
        firstAnswer.backgroundColor = .white
        firstAnswer.placeholder = "Введите вариант ответа "
        firstAnswer.font = firstAnswer.font?.withSize(20.0)
        firstAnswer.borderStyle = UITextField.BorderStyle.line
        firstAnswer.textAlignment = .center
    }
    private func createThirdAnswer() {
        thirdAnswer.backgroundColor = .white
        thirdAnswer.placeholder = "Введите верный вариант ответа "
        thirdAnswer.font = thirdAnswer.font?.withSize(20.0)
        thirdAnswer.borderStyle = UITextField.BorderStyle.line
        thirdAnswer.textAlignment = .center
    }
    private func createFourthAnswer() {
        fourthAnswer.backgroundColor = .white
        fourthAnswer.placeholder = "Введите вариант ответа "
        fourthAnswer.font = fourthAnswer.font?.withSize(20.0)
        fourthAnswer.borderStyle = UITextField.BorderStyle.line
        fourthAnswer.textAlignment = .center
    }
    private func createNewQuestionButton(){
        newQuestionButton = UIButton(type: .roundedRect)
        newQuestionButton.backgroundColor = .systemPink
        newQuestionButton.titleLabel?.textAlignment = .center
        newQuestionButton.setTitle("Создать вопрос", for: .normal)
        newQuestionButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 25)
        newQuestionButton.setTitleColor(.black, for: .normal)
        newQuestionButton.addTarget(self, action: #selector(tapBackButton), for: .touchDown)
    }
    @objc func tapBackButton(button: UIButton){
        let answers = [firstAnswer.text ?? "", secondAnswer.text ?? "", thirdAnswer.text ?? "", fourthAnswer.text ?? ""].shuffled()
        let question = Question(text: questionField.text ?? "", answer: thirdAnswer.text ?? "", variable: answers)
        Game.shared.questions.append(question)
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    private func setupConstraints() {
        questionField.translatesAutoresizingMaskIntoConstraints = false
        secondAnswer.translatesAutoresizingMaskIntoConstraints = false
        firstAnswer.translatesAutoresizingMaskIntoConstraints = false
        thirdAnswer.translatesAutoresizingMaskIntoConstraints = false
        fourthAnswer.translatesAutoresizingMaskIntoConstraints = false
        newQuestionButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            questionField.topAnchor.constraint(equalTo: view.topAnchor,constant: 70),
            questionField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            secondAnswer.topAnchor.constraint(equalTo: questionField.bottomAnchor, constant: 10),
            secondAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            firstAnswer.topAnchor.constraint(equalTo: secondAnswer.bottomAnchor, constant: 10),
            firstAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            thirdAnswer.topAnchor.constraint(equalTo: firstAnswer.bottomAnchor, constant: 10),
            thirdAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            fourthAnswer.topAnchor.constraint(equalTo: thirdAnswer.bottomAnchor, constant: 10),
            fourthAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            newQuestionButton.topAnchor.constraint(equalTo: fourthAnswer.bottomAnchor, constant: 10),
            newQuestionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
    
    
}
