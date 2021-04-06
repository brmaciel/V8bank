//
//  NewLoginPresenter.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/6/21.
//

import UIKit

class NewLoginPresenter {
    
    weak var view: NewLoginPresenterDelegate?
    
    
    // MARK: - Methods
    
    
    
}


// MARK: - Access from Interactor
extension NewLoginPresenter: NewLoginPresenterProtocol {
    func presentEmptyCPF() {
        view?.showEmptyCPF()
    }
    
    func presentInvalidCPF() {
        view?.showInvalidCPF()
    }
    
    func presentValidCPF() {
        view?.showValidCPF()
    }
}
