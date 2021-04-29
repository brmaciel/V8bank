//
//  MainMenuPresenter.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/17/21.
//

import UIKit
import Transactions

class MainMenuPresenter {
    
    weak var view: MainMenuPresenterDelegate?
    
    
    // MARK: - Methods
    
    func formatAsCurrency(_ value: Double) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.locale = Locale(identifier: "pt_br")
        currencyFormatter.numberStyle = .decimal
        
        return currencyFormatter.string(from: NSNumber(value: value))!
    }
    
}


// MARK: - Access from Interactor
extension MainMenuPresenter: MainMenuPresenterProtocol {
    func startRequest() {
        view?.startRequest()
    }
    
    func finishRequest() {
        view?.finishRequest()
    }
    
    func presentBalances(response: MainMenuModels.Response) {
        let balances: [MainMenuModels.ViewModel.Balances.BalanceViewModel] =  response.balances.map( { balance in
            let balanceAmount = formatAsCurrency(balance.amount)
            
            let viewModel = MainMenuModels.ViewModel.Balances.BalanceViewModel(title: balance.title, balance: balanceAmount, actionName: balance.actionName, action: balance.action)
            
            return viewModel
        } )
        
        let viewModel = MainMenuModels.ViewModel.Balances(balances: balances)
        view?.showBalances(viewModel: viewModel)
    }
    
    func presentError() {
        view?.showError()
    }
    
    func presentOperationOptions() {
        let operations = [
            MainMenuModels.ViewModel.OperationOptions.OperationOptionViewModel(image: .statementIcon, name: "Ver Extrato", action: BankStatementRouter.createModule),
            MainMenuModels.ViewModel.OperationOptions.OperationOptionViewModel(image: .eyeOpenBlack, name: "todo:\nCartão", action: BankStatementRouter.createModule)
        ]
        
        let viewModel = MainMenuModels.ViewModel.OperationOptions(operations: operations)
        view?.showOperationOptions(viewModel: viewModel)
    }
}
