//
//  Question.swift
//  Millionere
//
//  Created by Marcus on 12.07.2021.
//

import Foundation
struct Question {
    var text: String
    var answer: String
    var variable: [String]
}

class TestQuestion {
    static func createQuestions() -> [Question] {
        var questions: [Question] = []
        questions.append(Question(text: "Подвижный холм песка в пустыне называется…", answer: "Дюна", variable: ["Дюна", "Утес", "Скала", "Гора"]))
        questions.append(Question(text: "Чего не может торнадо?", answer: "Стоять на месте", variable: ["Стоять на месте"," Поднять в воздух автомобиль","Вырвать с корнями дерево","Разрушить здание"]))
        questions.append(Question(text: "Где находится яд у кобры?", answer: "В зубе", variable: ["На кончике языка", "В зубе", "На хвосте", "В капюшоне"]))
        questions.append(Question(text: "В древности китайцы научились делать из коконов шелковичных червей…", answer: "Шелк", variable: ["Приправу", "Бумагу", "Резину", "Шелк"]))
        questions.append(Question(text: "Хвост какого животного похож на весло?", answer: "Бобра", variable: ["Бобра", "Белки", "Лисы", "Медведя"]))
        return questions
    }
}
