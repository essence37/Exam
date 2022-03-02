//
//  Question.swift
//  Exam
//
//  Created by Пазин Даниил on 06.02.2022.
//

import Foundation

struct Question: Codable {
    let imageName: String?
    let question: String
    let responseOptions: [Int: String]
    let comment: String
    let correctAnswer: Int
}
