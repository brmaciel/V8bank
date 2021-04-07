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
    var worker: OBEnterLoginPasswordWorker?
    
    var loginInfo: LoginForm
    var currentPassword: String {
        get { return loginInfo.password }
        set { loginInfo.password = newValue }
    }
    let passwordLimitDigits = 6
    
    
    // MARK: Constructor
    init(cpf: String) {
        self.loginInfo = LoginForm(cpf: cpf, password: "")
    }
    
    
    // MARK: - Methods
    
    func respondPasswordToPresenter() {
        let response = OBEnterLoginPasswordModels.Response(password: currentPassword)
        presenter?.presentPassword(response: response)
    }
    
    func requestLogin() {
        presenter?.startRequest()
        worker?.sendLoginForm(loginInfo) {
            self.presenter?.finishRequest()
            self.router?.didLoginWithSuccess()
        } fail: {
            self.presenter?.finishRequest()
            self.manageLoginFailed()
        }
    }
    
    func manageLoginFailed() {
        presenter?.didFailLogin()
        currentPassword = ""
        respondPasswordToPresenter()
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
