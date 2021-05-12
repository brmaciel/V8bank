//
//  TRTransactionDetailsModels.swift
//  v8bank
//
//  Created by Bruno Maciel on 5/12/21.
//

import Foundation

enum TRTransactionDetailsModels {
    
    /// Object passed from View to Interactor
    struct Request {
        
    }
    
    /// Object passed from Interactor to Presenter
    struct Response {
        let transaction: TRStatementItem
        let date: String
    }
    
    /// Object passed from Presenter to View
    struct ViewModel {
        let dateTime: String
        let title: String
        let subtitle: String
        let value: String
    }
    
    /// Data Store
    struct DataStore {
        
    }
}
