//
//  Game.swift
//  Trivia
//
//  Created by Hoonsun Lee on 3/14/25.
//

import Foundation

struct Game {
    let genre: Genre
    let gameContent: GameContent
}


enum Genre {
    case KPOP
    case BRITPOP
    case POP
}
enum GameContent {
    case BTS
    case Barbie
    case ChappellRoan
    case Jennie
    case Oasis
    case SVT
    
    var question: String {
        switch self {
        case .BTS:
            return "What year did BTS release Permission to Dance?"
        case .Barbie:
            return "What Barbie OST won the Best Original Song award at the 2024 Oscars?"
        case .ChappellRoan:
            return "What album is the song Pink Pony Club in?"
        case .Jennie:
            return "What's the last song in her album, Ruby?"
        case .Oasis:
            return "How long was their hiatus before they announced a reunion tour?"
        case .SVT:
            return "What is Seventeen's debut song?"
        }
    }
    var answer: String {
        switch self {
        case .BTS:
            return "2021"
        case .Barbie:
            return "What was I made for"
        case .ChappellRoan:
            return "The Rise and Fall of a Midwest Princess"
        case .Jennie:
            return "twin"
        case .Oasis:
            return "15"
        case .SVT:
            return "Adore You"
        }
    }
    var incorrectOptions: [String] {
        switch self {
        case .BTS:
            return ["2020", "2022", "2019"]
        case .Barbie:
            return ["Barbie Girl", "Dance The Night", "I'm Just Ken"]
        case .ChappellRoan:
            return ["Nothing Good Comes From This", "A New Beginning", "Revelation"]
        case .Jennie:
            return ["solo", "lovesick girls", "you & me"]
        case .Oasis:
            return ["10", "20", "5"]
        case .SVT:
            return ["Mansae", "Don't Wanna Cry", "Home"]
        }
        
    }
}
