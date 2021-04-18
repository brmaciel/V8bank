//
//  BankStatementModels.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/18/21.
//

import Foundation

enum BankStatementModels {
    
    /// Object passed from View to Interactor
    struct Request {
        
    }
    
    /// Object passed from Interactor to Presenter
    struct Response {
        var statement: [String]
    }
    
    /// Object passed from Presenter to View
    struct ViewModel {
        
    }
    
    /// Data Store
    struct DataStore {
        
    }
}
