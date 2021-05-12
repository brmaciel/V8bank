//
//  BankStatementProtocols.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/18/21.
//

import Foundation

/// View -> Interactor
protocol BankStatementInteractorProtocol: AnyObject {
    func viewDidLoad()
    func tryAgainFetchingStatement()
    func presentTransactionDetails(section: Int, index: Int)
    func closeScreen()
}

/// Interactor -> Presenter
protocol BankStatementPresenterProtocol: AnyObject {
    func startRequest()
    func finishRequest()
    
    func presentStatement(response: BankStatementModels.Response)
    func presentEmptyStatement(response: BankStatementModels.Response)
    func presentError()
}

/// Presenter -> View
protocol BankStatementPresenterDelegate: AnyObject {
    func startRequest()
    func finishRequest()
    
    func showStatement(viewModel: BankStatementModels.ViewModel)
    func showError()
}
