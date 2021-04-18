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
        let viewModel = BankStatementModels.ViewModel()
        view?.showStatement(viewModel: viewModel)
    }
    
    func presentError() {
        view?.showError()
    }
}
