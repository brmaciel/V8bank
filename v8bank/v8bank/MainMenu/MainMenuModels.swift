//
//  MainMenuModels.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/17/21.
//

import UIKit

enum MainMenuModels {
    
    /// Object passed from View to Interactor
    struct Request {
        
    }
    
    /// Object passed from Interactor to Presenter
    struct Response {
        var balances: [BalancesStruct]
    }
    
    /// Object passed from Presenter to View
    struct ViewModel {
        /// ViewModel for the CollectionViewCells
        struct BalanceViewModel {
            let title: String
            private let balance: String
            let actionName: String
            var action: () -> UIViewController
            
            private var isHidden = false
            
            // Read-Only Properties
            var presentedBalance: String {
                return isHidden ? "•••••" : balance
            }
            var showHideImage: UIImage? {
                return isHidden ? UIImage.eyeClosed: UIImage.eyeOpen
            }
            
            
            // MARK: Constructor
            init(title: String, balance: String, actionName: String, action: @escaping () -> UIViewController) {
                self.title = title
                self.balance = balance
                self.actionName = actionName
                self.action = action
            }
            
            // MARK: Methods
            mutating func showHideBalance() {
                isHidden.toggle()
            }
        }
        
        private var balances: [BalanceViewModel]
        
        var numBalances: Int { return balances.count }
        
        
        // MARK: Constructor
        init(balances: [BalanceViewModel]) {
            self.balances = balances
        }
        
        // MARK: Mehods
        func balance(at index: Int) -> BalanceViewModel? {
            return balances[safe: index]
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
