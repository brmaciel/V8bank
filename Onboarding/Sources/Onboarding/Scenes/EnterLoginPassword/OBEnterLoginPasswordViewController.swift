//
//  OBEnterLoginPasswordViewController.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/6/21.
//

import UIKit

class OBEnterLoginPasswordViewController: UIViewController {
    
    // MARK: Outlets
    
    // MARK: Properties
    var interactor: OBEnterLoginPasswordInteractorProtocol?
    
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        setupView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
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
extension OBEnterLoginPasswordViewController: OBEnterLoginPasswordPresenterDelegate {
    
}
