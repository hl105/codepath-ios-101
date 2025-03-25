//
//  TriviaQuestionService.swift
//  Trivia
//
//  Created by Hoonsun Lee on 3/24/25.
//

import Foundation
//amount=5&difficulty=easy&type=multiple
class TriviaQuestionService {
    static func fetchQuestions(amount: Int, difficulty: String, completion: (([TriviaQuestion]) -> Void)? = nil){
        let parameters = "amount=\(amount)&difficulty=\(difficulty)&type=multiple"
        let url = URL(string: "https://opentdb.com/api.php?\(parameters)")!
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            // at this point, data contains data from response
            
            let decoder = JSONDecoder()
            let response = try! decoder.decode(TriviaAPIResponse.self, from: data!)
            DispatchQueue.main.async {
                completion?(response.triviaQuestion)
            }
        
        }
        task.resume()
    }
}
