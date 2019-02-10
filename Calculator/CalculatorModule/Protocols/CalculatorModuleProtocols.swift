//
//  CalculatorModuleProtocols.swift
//  Calculator
//
//  Created by Mai Hassan on 2/7/19.
//  Copyright © 2019 Mai Hassan. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

protocol CalculatorViewProtocol: class {
    var presenter: CalculatorPresenterProtocol? {get set}

    func showResult(result: String)
    func clearFields()
    func showErrorWarning(warningMsg: String)
}


protocol CalculatorPresenterProtocol: class {
    var view: CalculatorViewProtocol? {get set}
    var interactor: CalculatorInteractorProtocol? {get set}
    var router: CalculatorRouterProtocol? {get set} 
    func getResult(firstTerm: String, secondTerm: String, operation: String)
    func clearFields()
    func showError(errorMsg: String)
    func showResult(result: String)
    func goToResultView(navigationController: UINavigationController)
}


protocol CalculatorInteractorProtocol: class {
    var observable: Observable<String> {get}
    var presenter: CalculatorPresenterProtocol? {get set}
    func calculateResult(_ firstTerm: String, _ secondTerm: String, _ operation: String)
    
}

protocol CalculatorRouterProtocol: class {
    static func createModule()-> ViewController
    func pushToResultScreen(navigationConroller:UINavigationController)

}
