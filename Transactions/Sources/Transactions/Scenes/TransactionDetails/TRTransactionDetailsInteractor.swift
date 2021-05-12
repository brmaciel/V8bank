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
    
    
    // MARK: - Methods
    
    
    
}


// MARK: - Access from View
extension TRTransactionDetailsInteractor: TRTransactionDetailsInteractorProtocol {
    func viewDidLoad() {
        presenter?.presentDetails()
    }
    
    func closeScreen() {
        router?.dismissView()
    }
}
