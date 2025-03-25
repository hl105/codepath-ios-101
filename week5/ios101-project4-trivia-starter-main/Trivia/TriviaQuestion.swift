//
//  TriviaQuestion.swift
//  Trivia
//
//  Created by Mari Batilando on 4/6/23.
//

import Foundation
import HTMLString

//struct TriviaQuestion {
//  let category: String
//  let question: String
//  let correctAnswer: String
//  let incorrectAnswers: [String]
//}


struct TriviaAPIResponse: Decodable {
    let triviaQuestion: [TriviaQuestion]
    
    private enum CodingKeys: String, CodingKey{
        case triviaQuestion = "results"
    }
}

struct TriviaQuestion: Decodable {
    let category: String
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]
    
    private enum CodingKeys: String, CodingKey {
        case category, question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Decode raw strings
        let rawCategory = try container.decode(String.self, forKey: .category)
        let rawQuestion = try container.decode(String.self, forKey: .question)
        let rawCorrect = try container.decode(String.self, forKey: .correctAnswer)
        let rawIncorrect = try container.decode([String].self, forKey: .incorrectAnswers)
        
        // Use HTMLString to remove entitites
        category = rawCategory.removingHTMLEntities()
        question = rawQuestion.removingHTMLEntities()
        correctAnswer = rawCorrect.removingHTMLEntities()
        incorrectAnswers = rawIncorrect.map { $0.removingHTMLEntities() }
        
    }
}
 
