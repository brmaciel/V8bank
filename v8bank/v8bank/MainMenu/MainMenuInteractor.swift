//
//  MainMenuInteractor.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/17/21.
//

import Foundation

class MainMenuInteractor {
    
    var presenter: MainMenuPresenterProtocol?
    var router: MainMenuRouter?
    var worker: MainMenuWorker?
    
    
    // MARK: - Methods
    
    func fetchBalances() {
        presenter?.startRequest()
        worker?.getBalances(completion: { response in
            self.presenter?.finishRequest()
            self.manageBalanceResponse(response)
        }, fail: {
            self.presenter?.finishRequest()
            self.presenter?.presentError()
        })
    }
    
    func manageBalanceResponse(_ balances: [BalancesStruct]) {
        guard !balances.isEmpty else {
            // TODO: present empty balance error
            return }
        
        let response = MainMenuModels.Response(balances: balances)
        presenter?.presentBalances(response: response)
    }
    
}


// MARK: - Access from View
extension MainMenuInteractor: MainMenuInteractorProtocol {
    func viewDidLoad() {
        fetchBalances()
    }
    
    func tryAgainFetchingBalances() {
        fetchBalances()
    }
}
