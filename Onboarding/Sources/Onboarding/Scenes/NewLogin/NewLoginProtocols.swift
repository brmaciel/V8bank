//
//  NewLoginProtocols.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/6/21.
//

import Foundation

/// View -> Interactor
protocol NewLoginInteractorProtocol: AnyObject {
    func validateInput(request: NewLoginModels.Request)
    func enter(request: NewLoginModels.Request)
    func closeScreen()
}

/// Interactor -> Presenter
protocol NewLoginPresenterProtocol: AnyObject {
    func presentEmptyCPF()
    func presentInvalidCPF()
    func presentValidCPF()
}

/// Presenter -> View
protocol NewLoginPresenterDelegate: AnyObject {
    func showEmptyCPF()
    func showInvalidCPF()
    func showValidCPF()
}
