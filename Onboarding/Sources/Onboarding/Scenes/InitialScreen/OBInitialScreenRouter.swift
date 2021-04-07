//
//  OBInitialScreenRouter.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/6/21.
//

import UIKit

public class OBInitialScreenRouter {
    
    weak var view: OBInitialScreenViewController?
    
    
    // MARK: Create Module
    public static func createModule() -> UIViewController {
        let view = UIStoryboard(name: "OBInitialScreen", bundle: Bundle.module).instantiateInitialViewController() as! OBInitialScreenViewController
        let interactor = OBInitialScreenInteractor()
        let presenter = OBInitialScreenPresenter()
        let router = OBInitialScreenRouter()
        
        view.interactor = interactor
        interactor.presenter = presenter
        interactor.router = router
        presenter.view = view
        router.view = view
        
        return view
    }
    
    
    // MARK: - Routing
    
    func goToNewLogin() {
        let destinationVC = NewLoginRouter.createModule(coordinator: self)
        view?.present(destinationVC, animated: true, completion: nil)
    }
    
}

extension OBInitialScreenRouter: OBLoginCoordinator {
    func didEnterCPF(data: OBEnterLoginPasswordDependency) {
        let destinationVC = OBEnterLoginPasswordRouter.createModule(dependency: data, coordinator: self)
        view?.present(destinationVC, animated: true, completion: nil)
    }
    
    func didLogin() {
        print("TODO: login user")
    }
}


// MARK: - Coordinator Interfaces
protocol OBCoordinator: AnyObject {
    
}

/// Manage flow during login
protocol OBLoginCoordinator: OBCoordinator {
    func didEnterCPF(data: OBEnterLoginPasswordDependency)
    func didLogin()
}
