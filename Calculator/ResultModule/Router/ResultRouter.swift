//
//  ResultRouter.swift
//  Calculator
//
//  Created by Mai Hassan on 2/7/19.
//  Copyright © 2019 Mai Hassan. All rights reserved.
//

import Foundation
import UIKit

class ResultRouter: ResultRouterProtocol {
    
    static func createModule() -> ResultViewController {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        
        let presenter: ResultPresenterProtocol = ResultPresenter()
        let interactor: ResultInteractorProtocol = ResultInteractor()
        let router: ResultRouterProtocol = ResultRouter()
        
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
    
}
