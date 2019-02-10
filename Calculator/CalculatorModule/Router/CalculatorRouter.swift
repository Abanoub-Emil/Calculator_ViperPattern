//
//  CalculatorRouter.swift
//  Calculator
//
//  Created by Mai Hassan on 2/7/19.
//  Copyright © 2019 Mai Hassan. All rights reserved.
//

import Foundation
import UIKit

class CalculatorRouter: CalculatorRouterProtocol {
    
    static func createModule() -> ViewController {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "MyViewController") as! ViewController
        
        let presenter: CalculatorPresenterProtocol = CalculatorPresenter()
        let interactor: CalculatorInteractorProtocol = CalculatorInteractor()
        let router: CalculatorRouterProtocol = CalculatorRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    
    func pushToResultScreen(navigationConroller: UINavigationController) {
        let resultModuel = ResultRouter.createModule()
        navigationConroller.pushViewController(resultModuel, animated: true)
    }
}
