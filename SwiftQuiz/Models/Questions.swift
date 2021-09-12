//
//  Questions.swift
//  SwiftQuiz
//
//  Created by Александр on 12.09.21.
//

struct Question {
    let title: String
    let answer: Answers
    
    static func getFirstQuestion() -> Question {
        let title = DataManager.shared.questions[0]
        let answer = Answers(
            title: DataManager.shared.firstAnswer.shuffled(),
            correctAnswer: DataManager.shared.correctAnswers[0])

        return Question(title: title, answer: answer)
    }
    
}

struct Answers {
    let title: [String]
    let correctAnswer: String
}

enum Type: String {
    case junior, middle, senior
}

struct User {
    let name: String
}
