//
//  TRTransactionDetailsViewController.swift
//  v8bank
//
//  Created by Bruno Maciel on 5/12/21.
//

import UIKit

class TRTransactionDetailsViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var lb_dateTime: UILabel!
    @IBOutlet weak var lb_transactionTitle: UILabel!
    @IBOutlet weak var lb_transactionSubtitle: UILabel!
    @IBOutlet weak var lb_transactionValue: UILabel!
    
    // MARK: Properties
    var interactor: TRTransactionDetailsInteractorProtocol?
    
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    
    // MARK: - Setup View Methods
        
    private func setupView() {
        interactor?.viewDidLoad()
    }
    
    
    // MARK: - Methods
    
    
    
    // MARK: - Button Actions
    
    @IBAction func tapExitButton(_ button: UIButton) {
        interactor?.closeScreen()
    }
    
}


// MARK: - Access from Presenter
extension TRTransactionDetailsViewController: TRTransactionDetailsPresenterDelegate {
    func showDetails() {
        
    }
}
