//
//  ResultViewController.swift
//  Millionere
//
//  Created by Marcus on 12.07.2021.
//
import UIKit
import Foundation

class ResultViewController: UITableViewController {
    private var backButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createBackBotton()
        tableView.addSubview(backButton)
        
    }
    private func createBackBotton(){
        backButton = UIButton(type: .roundedRect)
        backButton.frame = CGRect(x: 300, y: 10, width: 100, height: 50)
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
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Game.shared.results.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = String(format: "Количество вопросов %d", Game.shared.results[indexPath.item].questionsCount)
        cell.detailTextLabel?.text = String(format: "Количество правильных ответов %d", Game.shared.results[indexPath.item].questionsSucsess)
        return cell
    }
}
