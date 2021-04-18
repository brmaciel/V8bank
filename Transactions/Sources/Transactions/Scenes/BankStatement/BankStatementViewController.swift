//
//  BankStatementViewController.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/18/21.
//

import UIKit
import CommonUI

class BankStatementViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var lb_balance: UILabel!
    @IBOutlet weak var btn_showHideBalance: UIButton!
    @IBOutlet weak var tableView_statement: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var view_error: V8GenericErrorView!
    
    // MARK: Properties
    var interactor: BankStatementInteractorProtocol?
    var viewModel: BankStatementModels.ViewModel?
    
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        setupView()
    }
    
    
    // MARK: - Setup View Methods
    
    private func delegates() {
        tableView_statement.delegate = self
        tableView_statement.dataSource = self
    }
        
    private func setupView() {
        interactor?.viewDidLoad()
    }
    
    
    // MARK: - Methods
    
    
    
    // MARK: - Button Actions
    
    @IBAction func tapShowHideBalance(_ sender: UIButton) {
        //viewModel?.showHideBalance()
    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
//        self.navigationController?.popViewController(animated: true)
//        self.dismiss(animated: true, completion: nil)
    }
    
}


// MARK: - Access from Presenter
extension BankStatementViewController: BankStatementPresenterDelegate {
    func startRequest() {
        view_error.hide()
        activityIndicator.startAnimating()
    }
    
    func finishRequest() {
        activityIndicator.stopAnimating()
    }
    
    func showStatement(viewModel: BankStatementModels.ViewModel) {
//        lb_balance.text = viewModel?.presentedBalance
//        btn_showHideBalance.setImage(viewModel?.showHideImage, for: .normal)
        
        self.viewModel = viewModel
        tableView_statement.reloadData()
    }
    
    func showError() {
        view_error.message = "Fail to retrieve statement\nTry again later"
        view_error.show()
    }
}


// MARK: - TableView Methods

extension BankStatementViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "<#cellId#>", for: indexPath) as! <#cellClass#>
//        cell.setup()
//
//        return cell
        return UITableViewCell()
    }
    
}
