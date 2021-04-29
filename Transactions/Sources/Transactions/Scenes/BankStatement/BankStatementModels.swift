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
            let value: String
            let isIncome: Bool
            
            var valueViewBackgroundColor: UIColor {
                return isIncome ? .v8lightGreen : .clear
            }
            
            var valueLabelColor: UIColor {
                return isIncome ? .v8mediumGreen : .v8red
            }
        }
        
        private let balance: String
        private var statement: [(date: String, statement: [StatementViewModel])]
        
        private var balanceIsHidden = false
        
        // Read-Only Properties
        var presentedBalance: String {
            return balanceIsHidden ? "•••••" : balance
        }
        var showHideImage: UIImage? {
            return balanceIsHidden ? UIImage.eyeClosedBlack : UIImage.eyeOpenBlack
        }
        var numOfSections: Int { return statement.count }
        var noResultsFound: Bool { return statement.isEmpty }
        
        
        // MARK: Constructor
        init(balance: String, statement: [(date: String, statement: [StatementViewModel])]) {
            self.balance = balance
            self.statement = statement
        }
        
        
        // MARK: Methods
        mutating func showHideBalance() {
            balanceIsHidden.toggle()
        }
        
        func numOfRows(in section: Int) -> Int {
            return statement[safe: section]?.statement.count ?? 0
        }
        
        func date(at section: Int) -> String {
            return statement[safe: section]?.date ?? ""
        }
        
        func item(section: Int, index: Int) -> StatementViewModel? {
            return statement[safe: section]?.statement[safe: index]
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
