//
//  NewLoginModels.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/6/21.
//

import Foundation

enum NewLoginModels {
    
    /// Object passed from View to Interactor
    struct Request {
        let cpf: String?
    }
    
    /// Object passed from Interactor to Presenter
    struct Response {
        
    }
    
    /// Object passed from Presenter to View
    struct ViewModel {
        
    }
    
    /// Data Store
    struct DataStore {
        
    }
}
