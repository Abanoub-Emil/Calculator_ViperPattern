//
//  CalculatorPresenter.swift
//  Calculator
//
//  Created by Mai Hassan on 2/7/19.
//  Copyright © 2019 Mai Hassan. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class CalculatorPresenter: CalculatorPresenterProtocol {
   
    
    weak var view: CalculatorViewProtocol?
    var interactor: CalculatorInteractorProtocol?
    var router: CalculatorRouterProtocol?
    var disposeBag = DisposeBag()
    
    func getResult(firstTerm: String, secondTerm: String, operation: String) {
        interactor?.calculateResult(firstTerm, secondTerm, operation)
    }
    
    func clearFields() {
        view?.clearFields()
    }
    
    func showError(errorMsg: String){
        view?.showErrorWarning(warningMsg: errorMsg)
    }
    
    func showResult(result: String) {
        interactor?.observable.subscribe(onNext: { [weak self] result in
            self?.view?.showResult(result: result)
            self?.clearFields()
        }).disposed(by: disposeBag)
        
    }
    
    func goToResultView(navigationController: UINavigationController) {
        router?.pushToResultScreen(navigationConroller: navigationController)
    }
    
}
