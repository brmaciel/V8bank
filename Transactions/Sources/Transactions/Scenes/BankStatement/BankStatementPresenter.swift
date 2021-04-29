//
//  BankStatementPresenter.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/18/21.
//

import UIKit

class BankStatementPresenter {
    
    weak var view: BankStatementPresenterDelegate?
    
    
    // MARK: - Methods
    
    func formatDate(_ dateString: String) -> String? {
        // TODO: format date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(identifier: "UTC")
        
        guard let date = formatter.date(from: dateString) else { return nil }
        
        formatter.dateFormat = "dd MMM, yyyy"
        
        return formatter.string(from: date)
    }
    
    func formatAsCurrency(_ value: Double, includeCurrencySymbol: Bool) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.locale = Locale(identifier: "pt_br")
        if includeCurrencySymbol {
            currencyFormatter.numberStyle = .currency
            currencyFormatter.currencySymbol = "R$"
        } else {
            currencyFormatter.numberStyle = .decimal
            currencyFormatter.maximumFractionDigits = 2
            currencyFormatter.minimumFractionDigits = 2
        }
        
        
        return currencyFormatter.string(from: NSNumber(value: value))!
    }
    
    func getStatementItemsVM(for groupDate: TRStatementGroupDate) -> [BankStatementModels.ViewModel.StatementViewModel] {
         return groupDate.items.map( { item in
            let value = formatAsCurrency(abs(item.value), includeCurrencySymbol: true)
            
            return BankStatementModels.ViewModel.StatementViewModel(title: item.title, subtitle: item.subtitle, value: value, isIncome: item.value >= 0)
        } )
    }
    
}


// MARK: - Access from Interactor
extension BankStatementPresenter: BankStatementPresenterProtocol {
    func startRequest() {
        view?.startRequest()
    }
    
    func finishRequest() {
        view?.finishRequest()
    }
    
    func presentStatement(response: BankStatementModels.Response) {
        let balance = formatAsCurrency(response.statement.balance, includeCurrencySymbol: false)
        let statement: [(date: String, statement: [BankStatementModels.ViewModel.StatementViewModel])] = response.statement.items.map( { groupDate in
            
            let formattedDate = formatDate(groupDate.date) ?? groupDate.date
            let items = getStatementItemsVM(for: groupDate)
            
            return (date: formattedDate, statement: items)
        } )
        
        let viewModel = BankStatementModels.ViewModel(balance: balance, statement: statement)
        view?.showStatement(viewModel: viewModel)
    }
    
    func presentError() {
        view?.showError()
    }
}
