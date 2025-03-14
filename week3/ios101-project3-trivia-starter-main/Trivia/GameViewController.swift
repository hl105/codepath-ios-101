//
//  GameViewController.swift
//  Trivia
//
//  Created by Hoonsun Lee on 3/13/25.
//

import UIKit

class GameViewController: UIViewController {
    
    private var score = 0
    private var games = [Game]()
    private var selectedQuestionIndex = 0
    private var correctAnswerIndex: Int?
    private var numGames = 0

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var option4Button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        games = createGames()
        numGames = games.count
        configure(with:games[selectedQuestionIndex])
    }
    
    private func createGames() -> [Game] {
        let game1 = Game(genre: .KPOP, gameContent: .BTS)
        let game2 = Game(genre: .POP, gameContent: .Barbie)
        let game3 = Game(genre: .POP, gameContent: .ChappellRoan)
        let game4 = Game(genre: .KPOP, gameContent: .Jennie)
        let game5 = Game(genre: .BRITPOP, gameContent: .Oasis)
        let game6 = Game(genre: .BRITPOP, gameContent: .Oasis)
        return [game1, game2, game3, game4, game5, game6]
        
    }
    
    private func configure(with game: Game){
        numberLabel.text = "Question: \(selectedQuestionIndex+1)/\(numGames)"
        genreLabel.text = "Music: \(game.genre)"
        questionLabel.text = game.gameContent.question
        
        let optionButtons = [option1Button!, option2Button!, option3Button!, option4Button!]
        for (index, button) in optionButtons.enumerated() {
                    button.tag = index
                }
        correctAnswerIndex = Int.random(in: 0..<optionButtons.count)
        optionButtons[correctAnswerIndex!].setTitle(game.gameContent.answer, for: .normal)
        var shuffledIncorrectOptions = game.gameContent.incorrectOptions.shuffled()
        for (index, button) in optionButtons.enumerated() {
            if index == correctAnswerIndex {
                continue
            }
            // remove first incorrectOption from shuffled array and assign it
            let incorrectOption = shuffledIncorrectOptions.removeFirst()
            button.setTitle(incorrectOption, for: .normal)
        }
    }
    @IBAction func didTapOption(_ sender: UIButton) {
        guard let correctIndex = correctAnswerIndex else {
            assertionFailure("Expecting correctAnswerIndex")
            return
        }
        let title: String
        if sender.tag == correctIndex{
            score = score + 1
            title = "Correct!"
        } else {
            title = "Incorrect!"
        }
        
        let alert = UIAlertController(title: title, message: "Current Score: \(score)/\(numGames)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
                // Continue to the next question after dismissing the alert
                self.selectedQuestionIndex += 1
                if self.selectedQuestionIndex < self.numGames {
                    self.configure(with: self.games[self.selectedQuestionIndex])
                } else {
                    // Show a final score alert if the game is finished.
                    let finalAlert = UIAlertController(title: "Game Over",
                                                       message: "Final Score: \(self.score)",
                                                       preferredStyle: .alert)
                    finalAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                }
            })
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    

}
