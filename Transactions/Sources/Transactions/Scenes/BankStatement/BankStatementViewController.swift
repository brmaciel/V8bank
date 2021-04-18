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
    @IBOutlet weak var view_balance: UIView!
    @IBOutlet weak var lb_balance: UILabel!
    @IBOutlet weak var btn_showHideBalance: UIButton!
    @IBOutlet weak var tableView_statement: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var view_error: V8GenericErrorView!
    
    // MARK: Properties
    var interactor: BankStatementInteractorProtocol?
    var viewModel: BankStatementModels.ViewModel? {
        didSet {
            lb_balance.text = viewModel?.presentedBalance
            btn_showHideBalance.setImage(viewModel?.showHideImage, for: .normal)
        }
    }
    
    
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
        view.bringSubviewToFront(view_error)
        view_balance.isHidden = true
        view_error.setTryAgainAction(#selector(tryAgainFetchingBalances), target: self)
        view_error.messageTextColor = .black
        interactor?.viewDidLoad()
    }
    
    
    // MARK: - Methods
    
    
    
    // MARK: - Button Actions
    
    @IBAction func tapShowHideBalance(_ sender: UIButton) {
        viewModel?.showHideBalance()
    }
    
    @objc func tryAgainFetchingBalances() {
        interactor?.tryAgainFetchingStatement()
    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        interactor?.closeScreen()
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
        self.viewModel = viewModel
        view_balance.isHidden = false
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
        return viewModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "statementCell", for: indexPath) as! TRBankStatementTableViewCell
        cell.viewModel = viewModel?.item(at: indexPath.row)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("TODO: present details")
    }
    
}
