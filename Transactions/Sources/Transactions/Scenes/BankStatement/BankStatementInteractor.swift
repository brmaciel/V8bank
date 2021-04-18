//
//  BankStatementInteractor.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/18/21.
//

import Foundation

class BankStatementInteractor {
    
    var presenter: BankStatementPresenterProtocol?
    var router: BankStatementRouter?
    var worker: BankStatementWorker?
    
    
    // MARK: - Methods
    
    func fetchStatement() {
        presenter?.startRequest()
        worker?.getStatement(completion: { response in
            self.presenter?.finishRequest()
            self.manageStatementResponse(response)
        }, fail: {
            self.presenter?.finishRequest()
            self.presenter?.presentError()
        })
    }
    
    func manageStatementResponse(_ statement: [String]) {
        guard !statement.isEmpty else {
            // TODO: present empty statement message
            return }
        
        let response = BankStatementModels.Response(statement: statement)
        presenter?.presentStatement(response: response)
    }
    
}


// MARK: - Access from View
extension BankStatementInteractor: BankStatementInteractorProtocol {
    func viewDidLoad() {
        fetchStatement()
    }
}
