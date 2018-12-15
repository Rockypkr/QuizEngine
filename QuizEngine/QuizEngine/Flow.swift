//
//  Flow.swift
//  QuizEngine
//
//  Created by Christophe Bugnon on 15/12/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import Foundation

protocol Router {
    typealias AnswerCallback = (String) -> Void
    func routesTo(question: String, answerCallback: @escaping AnswerCallback)
}

class Flow {
    let router: Router
    let questions: [String]

    init(questions: [String], router: Router) {
        self.router = router
        self.questions = questions
    }

    func start() {
        if let firstQuestion = questions.first {
            router.routesTo(question: firstQuestion, answerCallback: routeNext(firstQuestion))
        }
    }

    func routeNext(_ question: String) -> Router.AnswerCallback {
        return { [weak self] _ in
            guard let strongSelf = self else { return }

            let currentQuestionIndex = strongSelf.questions.index(of: question)!
            let nextQuestion = strongSelf.questions[currentQuestionIndex + 1]
            strongSelf.router.routesTo(question: nextQuestion, answerCallback: strongSelf.routeNext(nextQuestion))
        }
    }
}
