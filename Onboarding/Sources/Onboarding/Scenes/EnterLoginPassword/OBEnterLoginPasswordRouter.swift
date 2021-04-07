//
//  OBEnterLoginPasswordRouter.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/6/21.
//

import UIKit

class OBEnterLoginPasswordRouter {
    
    weak var view: OBEnterLoginPasswordViewController?
    weak var coordinator: OBLoginCoordinator?
    
    
    // MARK: Create Module
    static func createModule(dependency: OBEnterLoginPasswordDependency, coordinator: OBLoginCoordinator) -> UIViewController {
        let view = UIStoryboard(name: "OBEnterLoginPassword", bundle: Bundle.module).instantiateInitialViewController() as! OBEnterLoginPasswordViewController
        let interactor = OBEnterLoginPasswordInteractor(cpf: dependency.cpf)
        let presenter = OBEnterLoginPasswordPresenter()
        let router = OBEnterLoginPasswordRouter()
        let worker = OBEnterLoginPasswordWorker()
        
        view.interactor = interactor
        interactor.presenter = presenter
        interactor.router = router
        interactor.worker = worker
        presenter.view = view
        router.view = view
        router.coordinator = coordinator
        
        return view
    }
    
    
    // MARK: - Routing
    
    func didLoginWithSuccess() {
        view?.dismissView(animated: true, completion: {
            self.coordinator?.didLogin()
        })
    }
    
    func dismissView() {
        view?.dismissView(animated: true, completion: nil)
    }
    
}

protocol OBEnterLoginPasswordDependency {
    var cpf: String { get }
}
