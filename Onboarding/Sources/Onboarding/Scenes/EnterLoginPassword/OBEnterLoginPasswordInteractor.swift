//
//  OBEnterLoginPasswordInteractor.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/6/21.
//

import Foundation

class OBEnterLoginPasswordInteractor {
    
    var presenter: OBEnterLoginPasswordPresenterProtocol?
    var router: OBEnterLoginPasswordRouter?
    
    var currentPassword = ""
    let passwordLimitDigits = 6
    
    
    // MARK: - Methods
    
    func respondPasswordToPresenter() {
        let response = OBEnterLoginPasswordModels.Response(password: currentPassword)
        presenter?.presentPassword(response: response)
    }
    
    func requestLogin() {
        
    }
    
    
}


// MARK: - Access from View
extension OBEnterLoginPasswordInteractor: OBEnterLoginPasswordInteractorProtocol {
    func enterCharacter(request: OBEnterLoginPasswordModels.Request) {
        if request.enteredPassword.isEmpty {
            if !currentPassword.isEmpty {
                currentPassword.removeLast()
                respondPasswordToPresenter()
            }
            return }
        
        guard
            request.enteredPassword.count == 1,
            currentPassword.count < passwordLimitDigits,
            Int(request.enteredPassword) != nil
            else { return }
        
        currentPassword.append(request.enteredPassword)
        respondPasswordToPresenter()
        
        if currentPassword.count == passwordLimitDigits {
            presenter?.completedPassword()
            requestLogin()
        }
    }
    
    func closeScreen() {
        router?.dismissView()
    }
}
