//
//  MainMenuModels.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/17/21.
//

import Foundation

enum MainMenuModels {
    
    /// Object passed from View to Interactor
    struct Request {
        
    }
    
    /// Object passed from Interactor to Presenter
    struct Response {
        
    }
    
    /// Object passed from Presenter to View
    struct ViewModel {
        var numBalances = 2
        func balance(at index: Int) -> BalanceViewModel? {
            return BalanceViewModel(title: "Saldo", balance: "10.000,00", actionName: "EXTRATO", action: {print("show details")})
        }
    }
    
    /// Data Store
    struct DataStore {
        
    }
}


struct BalanceViewModel {
    var title: String
    var balance: String
    var actionName: String
    var action: () -> Void
    
    func showHideBalance() {
        print("TODO: show/hide")
    }
}
