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
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createPlayButton()
        view.addSubview(playButton)
        createResultButton()
        view.addSubview(resultButton)
        setupConstraints()
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
    
    private func setupConstraints() {
        playButton.translatesAutoresizingMaskIntoConstraints = false
        resultButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            playButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            playButton.heightAnchor.constraint(equalToConstant: 100),
            playButton.widthAnchor.constraint(equalToConstant: 300),
            
            resultButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 20),
            resultButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            resultButton.heightAnchor.constraint(equalTo: playButton.heightAnchor),
            resultButton.widthAnchor.constraint(equalTo: playButton.widthAnchor)
             ])
    }
}

