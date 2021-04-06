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
    struct ViewModel {
        let passwordLength: Int
    }
    
    /// Data Store
    struct DataStore {
        
    }
}
