//
//  ExamPapers.swift
//  Exam
//
//  Created by Пазин Даниил on 06.02.2022.
//

import Foundation

struct ExamPapers: Codable {
    static func loadExamPapers() -> [[Question]] {
        let url = Bundle.main.url(forResource: "ExamPapers", withExtension: "plist")!
        let decoder = PropertyListDecoder()
        do {
            let data = try Data(contentsOf: url)
            return try decoder.decode([[Question]].self, from: data)
        } catch let error {
            fatalError("\(error)")
        }
    }
}
