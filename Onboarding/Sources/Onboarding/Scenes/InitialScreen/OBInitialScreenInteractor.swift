//
//  OBInitialScreenInteractor.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/6/21.
//

import Foundation

class OBInitialScreenInteractor {
    
    var presenter: OBInitialScreenPresenterProtocol?
    var router: OBInitialScreenRouter?
    
    
    // MARK: - Methods
    
    
    
}


// MARK: - Access from View
extension OBInitialScreenInteractor: OBInitialScreenInteractorProtocol {
    func accessMyAccount() {
        // TODO: Check if has account data saved locally
        router?.goToNewLogin()
    }
}
