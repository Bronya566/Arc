//
//  ViewController.swift
//  Millionere
//
//  Created by Marcus on 11.07.2021.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    private var playButton = UIButton()
    private var resultButton = UIButton()
    private var settingButton = UIButton()
    private var newQuestion = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createNewButton()
        view.addSubview(newQuestion)
        createPlayButton()
        view.addSubview(playButton)
        createResultButton()
        view.addSubview(resultButton)
        createSettingButton()
        view.addSubview(settingButton)
        setupConstraints()
    }
    private func createNewButton(){
        newQuestion = UIButton(type: .custom)
        newQuestion.backgroundColor = .green
        newQuestion.titleLabel?.textAlignment = .center
        newQuestion.setTitle("Создать новый вопрос", for: .normal)
        newQuestion.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 25)
        newQuestion.setTitleColor(.black, for: .normal)
        newQuestion.addTarget(self, action: #selector(tapNewButton), for: .touchDown)
    }
    @objc func tapNewButton(button: UIButton) {
            let childVC = NewQuestion()
            self.addChild(childVC)
            childVC.view.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
            self.view.addSubview(childVC.view)
            childVC.didMove(toParent: self)
        }
    
    private func createPlayButton(){
        playButton = UIButton(type: .custom)
        playButton.backgroundColor = .green
        playButton.titleLabel?.textAlignment = .center
        playButton.setTitle("Играть", for: .normal)
        playButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 25)
        playButton.setTitleColor(.black, for: .normal)
        playButton.addTarget(self, action: #selector(tapPlayButton), for: .touchDown)
    }
    
    private func createResultButton(){
        resultButton = UIButton(type: .roundedRect)
        resultButton.backgroundColor = .blue
        resultButton.titleLabel?.textAlignment = .center
        resultButton.setTitle("Результат", for: .normal)
        resultButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 25)
        resultButton.setTitleColor(.black, for: .normal)
        resultButton.addTarget(self, action: #selector(tapResultButton), for: .touchDown)
    }
    private func createSettingButton(){
        settingButton = UIButton(type: .roundedRect)
        settingButton.backgroundColor = .red
        settingButton.titleLabel?.textAlignment = .center
        settingButton.setTitle("Настройка", for: .normal)
        settingButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 25)
        settingButton.setTitleColor(.white, for: .normal)
        settingButton.addTarget(self, action: #selector(tapSettingButton), for: .touchDown)
    }
    
    @objc func tapPlayButton(button: UIButton) {
            let childVC = ButtonViewController()
            self.addChild(childVC)
            childVC.view.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
            self.view.addSubview(childVC.view)
            childVC.didMove(toParent: self)
        }
    @objc func tapResultButton(button: UIButton) {
            let childVC = ResultViewController()
            self.addChild(childVC)
            childVC.view.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
            self.view.addSubview(childVC.view)
            childVC.didMove(toParent: self)
        }
    
    @objc func tapSettingButton(button: UIButton) {
        let childVC = SettingViewController()
        self.addChild(childVC)
        childVC.view.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.addSubview(childVC.view)
        childVC.didMove(toParent: self)
    }
    
    private func setupConstraints() {
        playButton.translatesAutoresizingMaskIntoConstraints = false
        resultButton.translatesAutoresizingMaskIntoConstraints = false
        settingButton.translatesAutoresizingMaskIntoConstraints = false
        newQuestion.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            playButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            playButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            playButton.heightAnchor.constraint(equalToConstant: 100),
            playButton.widthAnchor.constraint(equalToConstant: 300),
            
            resultButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 20),
            resultButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            resultButton.heightAnchor.constraint(equalTo: playButton.heightAnchor),
            resultButton.widthAnchor.constraint(equalTo: playButton.widthAnchor),
            
            settingButton.topAnchor.constraint(equalTo: resultButton.bottomAnchor, constant: 20),
            settingButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            settingButton.heightAnchor.constraint(equalTo: resultButton.heightAnchor),
            settingButton.widthAnchor.constraint(equalTo: resultButton.widthAnchor),
            
            newQuestion.topAnchor.constraint(equalTo: settingButton.bottomAnchor, constant: 20),
            newQuestion.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            newQuestion.heightAnchor.constraint(equalTo: settingButton.heightAnchor),
            newQuestion.widthAnchor.constraint(equalTo: settingButton.widthAnchor),
             ])
    }
}

