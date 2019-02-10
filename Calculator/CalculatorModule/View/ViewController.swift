//
//  ViewController.swift
//  Calculator
//
//  Created by Mai Hassan on 2/7/19.
//  Copyright © 2019 Mai Hassan. All rights reserved.
//

import UIKit
import RxCocoa

class ViewController: UIViewController {
   

    var presenter: CalculatorPresenterProtocol?
    
    @IBOutlet weak var firstTerm: UITextField!
    @IBOutlet weak var secondTerm: UITextField!
    @IBOutlet weak var result: UILabel!
    @IBOutlet var operationButtons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTerm.delegate = self
        secondTerm.delegate = self
        
        for btn in operationButtons {
            btn.rx.tap.bind { [weak self] _ in
                self?.presenter?.getResult(firstTerm: self?.firstTerm.text ?? "", secondTerm: self?.secondTerm.text ?? "", operation: (btn.titleLabel?.text)!)
                print((btn.titleLabel?.text!)!)
            }
        }
        
        presenter?.showResult(result: "")
     
    }

    
    @IBAction func calculateResult(_ sender: UIButton) {
        
//    presenter?.getResult(firstTerm: firstTerm.text ?? "", secondTerm: secondTerm.text ?? "", operation: (sender.titleLabel?.text)!)
        
    }
    
    
    @IBAction func navigateToResultView(_ sender: UIButton) {
        presenter?.goToResultView(navigationController: navigationController!)
    }
    
}


extension ViewController: UITextFieldDelegate {
    /**
     * Called when 'return' key pressed. return NO to ignore.
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    /**
     * Called when the user click on the view (outside the UITextField).
     */
     func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}


extension ViewController: CalculatorViewProtocol {
    func showResult(result: String) {
        self.result.text = result
    }
    
    func clearFields() {
        firstTerm.text = ""
        secondTerm.text = ""
    }
    
    func showErrorWarning(warningMsg: String) {
        self.result.text = warningMsg

    }
    
    
}
