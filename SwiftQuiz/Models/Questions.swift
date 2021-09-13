//
//  Questions.swift
//  SwiftQuiz
//
//  Created by Александр on 12.09.21.
//

struct Question {
    let title: String
    let answer: Answers
    
    static func getQuestions() -> [Question] {
        var questions: [Question] = []
        
        for index in 0..<5 {
            let qusetion = Question(
                title: DataManager.shared.questions[index],
                answer:
                    Answers(
                        title: DataManager.shared.answers[index].shuffled(),
                        correctAnswer: DataManager.shared.correctAnswers[index]
                    )
            )
            questions.append(qusetion)
        }
        
        return questions
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
