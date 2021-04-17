//
//  MainMenuPresenter.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/17/21.
//

import UIKit

class MainMenuPresenter {
    
    weak var view: MainMenuPresenterDelegate?
    
    
    // MARK: - Methods
    
    func getTitle(from balanceType: Int) -> String {
        switch balanceType {
            case 1:
                return "Saldo"
            case 2:
                return "Fatura Atual"
            case 3:
                return "Investimentos"
            default:
                return ""
        }
    }
    
    func getActionName(from balanceType: Int) -> String {
        switch balanceType {
            case 1:
                return "EXTRATO"
            case 2:
                return "FATURA"
            case 3:
                return "DETALHES"
            default:
                return ""
        }
    }
    
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
        let balances: [MainMenuModels.ViewModel.BalanceViewModel] =  response.balances.map( { balance in
            let title = getTitle(from: balance.balanceType)
            let balanceAmount = formatAsCurrency(balance.amount)
            let actionName = getActionName(from: balance.balanceType)
            let action = {print("show details")}
            
            let viewModel = MainMenuModels.ViewModel.BalanceViewModel(title: title, balance: balanceAmount, actionName: actionName, action: action)
            
            return viewModel
        } )
        
        let viewModel = MainMenuModels.ViewModel(balances: balances)
        view?.showBalances(viewModel: viewModel)
    }
}
