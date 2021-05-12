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
    
    
    
}


// MARK: - Access from Interactor
extension TRTransactionDetailsPresenter: TRTransactionDetailsPresenterProtocol {
    func presentDetails() {
        view?.showDetails()
    }
}
