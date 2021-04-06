//
//  OBInitialScreenViewController.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/6/21.
//

import UIKit

class OBInitialScreenViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var stack_buttons: UIStackView!
    @IBOutlet weak var constraint_titleCenterY: NSLayoutConstraint!
    
    // MARK: Properties
    var interactor: OBInitialScreenInteractorProtocol?
    private var isSettingUp = true
    
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if isSettingUp { animateTitleToTop() }
        isSettingUp = false
    }
    
    
    // MARK: - Setup View Methods
    
    private func delegates() {
        
    }
        
    private func setupView() {
        stack_buttons.alpha = 0
    }
    
    
    // MARK: - Methods
    
    func animateTitleToTop() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            self.constraint_titleCenterY.priority = UILayoutPriority(rawValue: 1)
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.animateShowButtons()
        }
    }
    
    func animateShowButtons() {
        UIView.animate(withDuration: 0.3) {
            self.stack_buttons.alpha = 1
        }
    }
    
    
    // MARK: - Button Actions
    
    @IBAction func tapOpenAccountButton(_ sender: UIButton) {
        // TODO: Go to open new account
        print("open new account")
    }
    
    @IBAction func tapAccessAccountButton(_ sender: UIButton) {
        interactor?.accessMyAccount()
    }
    
}


// MARK: - Access from Presenter
extension OBInitialScreenViewController: OBInitialScreenPresenterDelegate {
    
}
