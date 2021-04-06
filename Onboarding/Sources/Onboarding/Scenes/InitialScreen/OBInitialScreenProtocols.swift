//
//  OBInitialScreenProtocols.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/6/21.
//

import Foundation

/// View -> Interactor
protocol OBInitialScreenInteractorProtocol: AnyObject {
    func accessMyAccount()
}

/// Interactor -> Presenter
protocol OBInitialScreenPresenterProtocol: AnyObject {
    
}

/// Presenter -> View
protocol OBInitialScreenPresenterDelegate: AnyObject {
    
}
