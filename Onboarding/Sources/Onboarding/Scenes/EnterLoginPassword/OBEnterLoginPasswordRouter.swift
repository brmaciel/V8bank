//
//  OBEnterLoginPasswordRouter.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/6/21.
//

import UIKit

class OBEnterLoginPasswordRouter {
    
    weak var view: OBEnterLoginPasswordViewController?
    
    
    // MARK: Create Module
    static func createModule() -> UIViewController {
        let view = UIStoryboard(name: "OBEnterLoginPassword", bundle: Bundle.module).instantiateInitialViewController() as! OBEnterLoginPasswordViewController
        let interactor = OBEnterLoginPasswordInteractor()
        let presenter = OBEnterLoginPasswordPresenter()
        let router = OBEnterLoginPasswordRouter()
        
        view.interactor = interactor
        interactor.presenter = presenter
        interactor.router = router
        presenter.view = view
        router.view = view
        
        return view
    }
    
    
    // MARK: - Routing
    
    func dismissView() {
        view?.dismiss(animated: true, completion: nil)
    }
    
}
