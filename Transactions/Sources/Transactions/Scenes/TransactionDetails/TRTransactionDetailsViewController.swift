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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.3) {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        }
    }
    
    
    // MARK: - Setup View Methods
        
    private func setupView() {
        interactor?.viewDidLoad()
    }
    
    
    // MARK: - Methods
    
    
    
    // MARK: - Button Actions
    
    @IBAction func tapExitButton(_ button: UIButton) {
        view.backgroundColor = .clear
        interactor?.closeScreen()
    }
    
}


// MARK: - Access from Presenter
extension TRTransactionDetailsViewController: TRTransactionDetailsPresenterDelegate {
    func showDetails(viewModel: TRTransactionDetailsModels.ViewModel) {
        lb_dateTime.text = viewModel.dateTime
        lb_transactionTitle.text = viewModel.title
        lb_transactionSubtitle.text = viewModel.subtitle
        lb_transactionValue.text = viewModel.value
    }
}
