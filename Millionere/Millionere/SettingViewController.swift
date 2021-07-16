//
//  SettingViewController.swift
//  Millionere
//
//  Created by Marcus on 16.07.2021.
//

import Foundation
import UIKit

class SettingViewController: UIViewController {
    private var randomButton = UISwitch()
    private var textSwitch = UILabel()
    private var backButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createTextSwitch()
        view.addSubview(textSwitch)
        view.addSubview(randomButton)
        createBackBotton()
        view.addSubview(backButton)
        setupConstraints()
    }
    private func createTextSwitch(){
        textSwitch.text = " Случайный порядок"
        randomButton.addTarget(self, action: #selector(tapSwitchButton(button:)), for: .allEvents)
    }
    
    private func createBackBotton(){
        backButton = UIButton(type: .roundedRect)
        backButton.backgroundColor = .systemPink
        backButton.titleLabel?.textAlignment = .center
        backButton.setTitle("Назад", for: .normal)
        backButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 25)
        backButton.setTitleColor(.black, for: .normal)
        backButton.addTarget(self, action: #selector(tapBackButton), for: .touchDown)
    }
    @objc func tapBackButton(button: UIButton){
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    @objc func tapSwitchButton(button: UISwitch) {
        if button.isOn {
            Game.shared.isRandomQueueSetting = true
        } else {
            Game.shared.isRandomQueueSetting = false
        }
    }
    private func setupConstraints() {
        randomButton.translatesAutoresizingMaskIntoConstraints = false
        textSwitch.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: backButton.topAnchor),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textSwitch.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            textSwitch.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            textSwitch.heightAnchor.constraint(equalTo: randomButton.heightAnchor),
            textSwitch.widthAnchor.constraint(equalToConstant: view.frame.size.width / 1.5),
            
            randomButton.topAnchor.constraint(equalTo: textSwitch.topAnchor),
            randomButton.leftAnchor.constraint(equalTo: textSwitch.rightAnchor,constant: 30)
        ])
    }
    
}
