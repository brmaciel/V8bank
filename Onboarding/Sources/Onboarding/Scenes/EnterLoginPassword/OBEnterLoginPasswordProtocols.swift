//
//  OBEnterLoginPasswordProtocols.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/6/21.
//

import Foundation

/// View -> Interactor
protocol OBEnterLoginPasswordInteractorProtocol: AnyObject {
    func enterCharacter(request: OBEnterLoginPasswordModels.Request)
    func closeScreen()
}

/// Interactor -> Presenter
protocol OBEnterLoginPasswordPresenterProtocol: AnyObject {
    func presentPassword(response: OBEnterLoginPasswordModels.Response)
    func completedPassword()
    
    func startRequest()
    func finishRequest()
    func didFailLogin()
}

/// Presenter -> View
protocol OBEnterLoginPasswordPresenterDelegate: AnyObject {
    func showCurrentPassword(viewModel: OBEnterLoginPasswordModels.ViewModel.Password)
    func completedPassword()
    
    func startRequest()
    func finishRequest()
    func showLoginDidFailMessage(viewModel: OBEnterLoginPasswordModels.ViewModel.ErrorMessage)
}
