//
//  TRTransactionDetailsInteractor.swift
//  v8bank
//
//  Created by Bruno Maciel on 5/12/21.
//

import Foundation

class TRTransactionDetailsInteractor {
    
    var presenter: TRTransactionDetailsPresenterProtocol?
    var router: TRTransactionDetailsRouter?
    
    let transaction: TRStatementItem
    let date: String
    
    
    // MARK: - Constructor
    init(model: TRTransactionDetailsDependency) {
        self.transaction = model.transaction
        self.date = model.date
    }
    
    
    // MARK: - Methods
    
    
    
}


// MARK: - Access from View
extension TRTransactionDetailsInteractor: TRTransactionDetailsInteractorProtocol {
    func viewDidLoad() {
        let response = TRTransactionDetailsModels.Response(transaction: transaction, date: date)
        presenter?.presentDetails(response: response)
    }
    
    func closeScreen() {
        router?.dismissView()
    }
}
