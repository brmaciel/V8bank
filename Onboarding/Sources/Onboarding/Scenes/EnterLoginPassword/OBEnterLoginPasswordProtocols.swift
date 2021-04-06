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
}

/// Presenter -> View
protocol OBEnterLoginPasswordPresenterDelegate: AnyObject {
    func showCurrentPassword(viewModel: OBEnterLoginPasswordModels.ViewModel)
    func completedPassword()
}
