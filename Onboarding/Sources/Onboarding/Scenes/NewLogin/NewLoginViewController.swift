//
//  NewLoginViewController.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/6/21.
//

import UIKit

class NewLoginViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var view_card: UIView!
    @IBOutlet weak var view_cpf: BorderedView!
    @IBOutlet weak var lb_cpf: UILabel!
    @IBOutlet weak var field_cpf: UITextField!
    @IBOutlet weak var btn_enter: V8ConfirmButton!
    
    // MARK: Properties
    var interactor: NewLoginInteractorProtocol?
    private var isSettingUp = true
    
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if isSettingUp {
            UIView.animate(withDuration: 0.3) {
                self.view.backgroundColor = UIColor.black.withAlphaComponent(0.25)
            }
        }
        isSettingUp = false
    }
    
    
    // MARK: - Setup View Methods
    
    private func delegates() {
        
    }
        
    private func setupView() {
        btn_enter.disable()
        
//        field_cpf.becomeFirstResponder()
    }
    
    
    // MARK: - Methods
    
    
    
    // MARK: - Button Actions
    
    @IBAction func tapEnterButton(_ sender: UIButton) {
        print("enter")
    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        if field_cpf.isFirstResponder { field_cpf.resignFirstResponder() }
        else {
            self.view.backgroundColor = .clear
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}


// MARK: - Access from Presenter
extension NewLoginViewController: NewLoginPresenterDelegate {
    
}
