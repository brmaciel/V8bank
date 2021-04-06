//
//  OBEnterLoginPasswordPresenter.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/6/21.
//

import Foundation

class OBEnterLoginPasswordPresenter {
    
    weak var view: OBEnterLoginPasswordPresenterDelegate?
    
    
    // MARK: - Methods
    
    
    
}


// MARK: - Access from Interactor
extension OBEnterLoginPasswordPresenter: OBEnterLoginPasswordPresenterProtocol {
    func presentPassword(response: OBEnterLoginPasswordModels.Response) {
        let viewModel = OBEnterLoginPasswordModels.ViewModel(passwordLength: response.password.count)
        view?.showCurrentPassword(viewModel: viewModel)
    }
    
    func completedPassword() {
        view?.completedPassword()
    }

}
