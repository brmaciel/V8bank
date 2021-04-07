//
//  OBInitialScreenViewController.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/6/21.
//

import UIKit

class OBInitialScreenViewController: UIViewController {
    
    // MARK: Outlets
    
    
    // MARK: Properties
    var interactor: OBInitialScreenInteractorProtocol?
    
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    
    // MARK: - Setup View Methods
        
    private func setupView() {
        
    }
    
    
    // MARK: - Methods
    
    
    
    // MARK: - Button Actions
    
    @IBAction func tapOpenAccountButton(_ sender: UIButton) {
        interactor?.createAccount()
    }
    
    @IBAction func tapAccessAccountButton(_ sender: UIButton) {
        interactor?.accessMyAccount()
    }
    
}


// MARK: - Access from Presenter
extension OBInitialScreenViewController: OBInitialScreenPresenterDelegate {
    
}
