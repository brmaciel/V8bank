//
//  TRTransactionDetailsPresenter.swift
//  v8bank
//
//  Created by Bruno Maciel on 5/12/21.
//

import UIKit

class TRTransactionDetailsPresenter {
    
    weak var view: TRTransactionDetailsPresenterDelegate?
    
    
    // MARK: - Methods
    
    func formatDate(_ dateString: String) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(identifier: "UTC")
        
        guard let date = formatter.date(from: dateString) else { return nil }
        
        formatter.dateFormat = "dd MMM yyyy"
        
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
    
}


// MARK: - Access from Interactor
extension TRTransactionDetailsPresenter: TRTransactionDetailsPresenterProtocol {
    func presentDetails(response: TRTransactionDetailsModels.Response) {
        let dateTime = (formatDate(response.date) ?? response.date) + " - HH:mm"
        let value = formatAsCurrency(abs(response.transaction.value), includeCurrencySymbol: false)
        
        let viewModel = TRTransactionDetailsModels.ViewModel(dateTime: dateTime, title: response.transaction.title, subtitle: response.transaction.subtitle, value: value)
        view?.showDetails(viewModel: viewModel)
    }
}
