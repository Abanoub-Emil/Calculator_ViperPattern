//
//  ResultPresenter.swift
//  Calculator
//
//  Created by Mai Hassan on 2/7/19.
//  Copyright © 2019 Mai Hassan. All rights reserved.
//

import Foundation

class ResultPresenter: ResultPresenterProtocol {
    
    
    weak var view: ResultViewProtocol?
    
    var interactor: ResultInteractorProtocol?
    
    var router: ResultRouterProtocol?
    
    
    
}
