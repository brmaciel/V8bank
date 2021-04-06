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
        
        delegates()
        setupView()
    }
    
    
    // MARK: - Setup View Methods
    
    private func delegates() {
        
    }
        
    private func setupView() {
        
    }
    
    
    // MARK: - Methods
    
    
    
    // MARK: - Button Actions
    
    
}


// MARK: - Access from Presenter
extension OBInitialScreenViewController: OBInitialScreenPresenterDelegate {
    
}
