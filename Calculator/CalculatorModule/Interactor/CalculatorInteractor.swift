//
//  CalculatorInteractor.swift
//  Calculator
//
//  Created by Mai Hassan on 2/7/19.
//  Copyright © 2019 Mai Hassan. All rights reserved.
//

import Foundation
import RxSwift

class CalculatorInteractor: CalculatorInteractorProtocol {
    
    weak var presenter: CalculatorPresenterProtocol?
    var myResult = Variable<String>("")
    var observable: Observable<String> {
        return myResult.asObservable()
    }
    
    func calculateResult(_ firstTerm: String, _ secondTerm: String, _ operation: String) {
        switch operation {
        case "+":
            add(firstTerm, secondTerm)
            break
            
        case "-":
            subtract(firstTerm, secondTerm)
            break
            
        case "*":
            multiply(firstTerm, secondTerm)
            
        case "/":
            divide(firstTerm, secondTerm)
            
        default:
            presenter?.showError(errorMsg: "Cannot identify Operation")
        }
    }
    
    func add(_ firstTerm: String, _ secondTerm: String) {
        guard let tupleTerms = parseToDouble(firstTerm, secondTerm) else {
            presenter?.showError(errorMsg: "Please enter valid numbers")
            return
        }
        
        let result = tupleTerms.0 + tupleTerms.1
//        presenter?.showResult(result: String(result))
        myResult.value = String(result)
    }
    
    func subtract(_ firstTerm: String, _ secondTerm: String) {
        guard let tupleTerms = parseToDouble(firstTerm, secondTerm) else {
            presenter?.showError(errorMsg: "Please enter valid numbers")
            return
        }
        
        let result = tupleTerms.0 - tupleTerms.1
//        presenter?.showResult(result: String(result))
        myResult.value = String(result)

    }
    
    func multiply(_ firstTerm: String, _ secondTerm: String) {
        guard let tupleTerms = parseToDouble(firstTerm, secondTerm) else {
            presenter?.showError(errorMsg: "Please enter valid numbers")
            return
        }
        
        let result = tupleTerms.0 * tupleTerms.1
//        presenter?.showResult(result: String(result))
        myResult.value = String(result)

    }
    
    func divide(_ firstTerm: String, _ secondTerm: String) {
        
        guard let tupleTerms = parseToDouble(firstTerm, secondTerm) else {
            presenter?.showError(errorMsg: "Please enter valid numbers")
            return
        }
        
        if tupleTerms.1 == 0 {
            presenter?.showError(errorMsg: "Cannot divide by zero")
            return
        }
        
        let result = tupleTerms.0 / tupleTerms.1
//        presenter?.showResult(result: String(result))
        myResult.value = String(result)

    }
    
    func parseToDouble(_ firstTerm: String, _ secondTerm: String) -> (_: Double, _: Double)? {
        
        let first = Double(firstTerm)
        let second = Double(secondTerm)
        if first == nil || second == nil {
           return nil
        }
        
        return (first! ,second!)
    }
    
    
}
