//
//  TRTransactionDetailsProtocols.swift
//  v8bank
//
//  Created by Bruno Maciel on 5/12/21.
//

import Foundation

/// View -> Interactor
protocol TRTransactionDetailsInteractorProtocol: AnyObject {
    func viewDidLoad()
    func closeScreen()
}

/// Interactor -> Presenter
protocol TRTransactionDetailsPresenterProtocol: AnyObject {
    func presentDetails(response: TRTransactionDetailsModels.Response)
}

/// Presenter -> View
protocol TRTransactionDetailsPresenterDelegate: AnyObject {
    func showDetails(viewModel: TRTransactionDetailsModels.ViewModel)
}
