//
//  QuestionViewController.swift
//  SwiftQuiz
//
//  Created by Александр on 12.09.21.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var progressView: UIProgressView!
    
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var answersButton: [UIButton]!
    
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    private var answersChosen: [String] = []
    private var currentAnswers: Answers {
        questions[questionIndex].answers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        view.backgroundColor = .systemGray6
        questionLabel.backgroundColor = .white
    }
    
    override func viewWillLayoutSubviews() {
        setupButtons()
    }
    
    @IBAction func answerButtonsTapper(_ sender: UIButton) {
        guard let buttonIndex = answersButton.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers.title[buttonIndex]
        answersChosen.append(currentAnswer)
        
        updateUI()
        nextQuestion()
    }
    
    @IBAction func hintButtonTapped(_ sender: Any) {
        alertController()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let resultVC = segue.destination as? ResultViewController else { return }
//        resultVC. = answersChosen
//        resultVC. = questions
    }
}

extension QuestionViewController {
    
    private func updateUI() {

        title = "Вопрос \(questionIndex + 1)/\(questions.count)"
        
        let currentQuestion = questions[questionIndex]
        
        questionLabel.text = currentQuestion.title
        
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        progressView.setProgress(totalProgress, animated: true)
        
        showCurrentAnswer(for: currentQuestion.answers)
    }
    
    private func showCurrentAnswer(for answers: Answers) {
        for (button, title) in zip(answersButton, answers.title) {
            button.setTitle(title, for: .normal)
        }
    }
    
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
            return
        }
        performSegue(withIdentifier: "showResult", sender: nil)
    }
    
    private func setupButtons() {
        for button in answersButton {
            button.backgroundColor = .systemYellow
            button.titleLabel?.lineBreakMode = .byWordWrapping
            button.layer.cornerRadius = 15
            button.tintColor = .black
        }
    }
    
    private func alertController() {
        let alertController = UIAlertController(title: "Ответ не верный", message: "Правильный ответ", preferredStyle: .alert)
        let OkAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(OkAction)
        present(alertController, animated: true, completion: nil)
    }
}
