//
//  SimpleCalculatorTests.swift
//  SimpleCalculatorTests
//
//  Created by Gemma Emery on 03-03-2024.
//

import XCTest

final class SimpleCalculatorTests: XCTestCase {
    var calculator: SimpleCalculator!

    override func setUpWithError() throws {
        calculator = SimpleCalculator()
    }

    override func tearDownWithError() throws {
        calculator = nil
    }

    func testCircleArea() throws {
        let arg = 5
        let result = calculator.circleArea(radius: Double(arg))
        XCTAssertEqual(result, 3.14 * pow(Double(arg), 2))
    }

    func testFibonacci() throws {
        let testCases = [
            (input: -5, expected: 0),
            (input: 0, expected: 0),
            (input: 1, expected: 1),
            (input: 2, expected: 1),
            (input: 3, expected: 2),
            (input: 11, expected: 89)
        ]
        for testCase in testCases {
            let result = calculator.fibonacci(n: testCase.input)
            XCTAssertEqual(result, testCase.expected)
        }
    }
    
    func testFahrenheit() throws {
        let arg = 25
        let result = calculator.fahrenheit(celcius: Double(arg))
        XCTAssertEqual(result, 1.8 * Double(arg) + 32)
    }
    
    func testIsEven() throws {
        let testCases = [
            (input: -5, expected: false),
            (input: -2, expected: true),
            (input: -1, expected: false),
            (input: 0, expected: true),
            (input: 1, expected: false),
            (input: 2, expected: true),
            (input: 7, expected: false),
            (input: 3546467, expected: false),
            (input: 354646, expected: true)
        ]
        for testCase in testCases {
            let result = calculator.isEven(num: testCase.input)
            if testCase.expected {
                XCTAssertTrue(result)
            } else {
                XCTAssertFalse(result)
            }
        }
    }
    
    func testGetAvg() throws {
        let testCases: [(input: [Double], expected: Double?)] = [
            (input: [], expected: nil),
            (input: [1], expected: 1),
            (input: [1, 3], expected: 2),
            (input: [5, 7, 8], expected: 20.0 / 3),
            (input: [4.5, 8.7], expected: 6.6),
            (input: [-5.6, 46.7, 45.8], expected: 28.96666666666667),
            (input: [-1], expected: -1),
            (input: [0, 0, 0, 0, 0], expected: 0)
        ]
        
        for testCase in testCases {
            let result = calculator.getAvg(numbers: testCase.input)
            if testCase.expected != nil {
                XCTAssertNotNil(result)
                XCTAssertEqual(result, testCase.expected)
            } else {
                XCTAssertNil(result)
            }
        }
        
    }

}
