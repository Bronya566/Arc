//
//  Strategy.swift
//  Millionere
//
//  Created by Marcus on 16.07.2021.
//

import Foundation
import UIKit

protocol QueueSettingStrategyProtocol {
    func getQuestions(from questions: [Question]) -> [Question]
}

class SimpleQueueSettingStrategy: QueueSettingStrategyProtocol {
    func getQuestions(from questions: [Question]) -> [Question] {
        return questions
    }
}

class RandomQueueSettingStrategy: QueueSettingStrategyProtocol {
    func getQuestions(from questions: [Question]) -> [Question] {
        return questions.shuffled()
    }
}
