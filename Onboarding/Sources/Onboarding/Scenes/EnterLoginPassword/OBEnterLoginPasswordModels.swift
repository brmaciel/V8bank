//
//  OBEnterLoginPasswordModels.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/6/21.
//

import Foundation

enum OBEnterLoginPasswordModels {
    
    /// Object passed from View to Interactor
    struct Request {
        let enteredPassword: String
    }
    
    /// Object passed from Interactor to Presenter
    struct Response {
        let password: String
    }
    
    /// Object passed from Presenter to View
    enum ViewModel {
        struct Password {
            let passwordLength: Int
        }
        
        struct ErrorMessage {
            let message: String
        }
    }
    
    /// Data Store
    struct DataStore {
        
    }
}


struct LoginForm: Encodable {
    var cpf: String
    var password: String
}
