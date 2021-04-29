//
//  MainMenuProtocols.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/17/21.
//

import Foundation

/// View -> Interactor
protocol MainMenuInteractorProtocol: AnyObject {
    func viewDidLoad()
    func tryAgainFetchingBalances()
}

/// Interactor -> Presenter
protocol MainMenuPresenterProtocol: AnyObject {
    func startRequest()
    func finishRequest()
    
    func presentBalances(response: MainMenuModels.Response)
    func presentError()
    
    func presentOperationOptions()
}

/// Presenter -> View
protocol MainMenuPresenterDelegate: AnyObject {
    func startRequest()
    func finishRequest()
    
    func showBalances(viewModel: MainMenuModels.ViewModel.Balances)
    func showError()
    
    func showOperationOptions(viewModel: MainMenuModels.ViewModel.OperationOptions)
}
