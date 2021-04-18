//
//  BankStatementModels.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/18/21.
//

import UIKit

enum BankStatementModels {
    
    /// Object passed from View to Interactor
    struct Request {
        
    }
    
    /// Object passed from Interactor to Presenter
    struct Response {
        var statement: TRStatement
    }
    
    /// Object passed from Presenter to View
    struct ViewModel {
        struct StatementViewModel {
            let title: String
            let subtitle: String
            let date: String
            let value: String
        }
        
        private let balance: String
        private var statement: [StatementViewModel]
        
        var count: Int { return statement.count }
        
        private var balanceIsHidden = false
        
        // Read-Only Properties
        var presentedBalance: String {
            return balanceIsHidden ? "•••••" : balance
        }
        var showHideImage: UIImage? {
            return balanceIsHidden ? UIImage.eyeClosedBlack : UIImage.eyeOpenBlack
        }
        
        
        // MARK: Constructor
        init(balance: String, statement: [StatementViewModel]) {
            self.balance = balance
            self.statement = statement
        }
        
        
        // MARK: Methods
        mutating func showHideBalance() {
            balanceIsHidden.toggle()
        }
        
        func item(at index: Int) -> StatementViewModel? {
            return statement[safe: index]
        }
    }
    
    /// Data Store
    struct DataStore {
        
    }
}

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
