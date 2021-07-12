//
//  ResultViewController.swift
//  Millionere
//
//  Created by Marcus on 12.07.2021.
//
import UIKit
import Foundation

class ResultViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
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
