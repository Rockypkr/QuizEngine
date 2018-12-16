//
//  ResultViewControllerTest.swift
//  QuizAppTests
//
//  Created by Christophe Bugnon on 16/12/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import XCTest
@testable import QuizApp

class ResultViewControllerTest: XCTestCase {

    func test_viewDidLoad_renderSummary() {
        XCTAssertEqual(makeSUT(summary: "a summary").navigationItem.title, "a summary")
    }

    func test_viewDidLoad_withoutAnswers_doesNotRenderAnswers() {
        XCTAssertEqual(makeSUT(answers: []).tableView.numberOfRows(inSection: 0), 0)
    }

    func test_viewDidLoad_withOneAnswer_renderAnswer() {
        XCTAssertEqual(makeSUT(answers: ["A1"]).tableView.numberOfRows(inSection: 0), 1)
    }

    // MARK: - Helpers
    private func makeSUT(summary: String = "", answers: [String] = []) -> ResultViewController {
        let sut = ResultViewController(summary: summary, answers: answers)
        _ = sut.view
        return sut
    }
}
