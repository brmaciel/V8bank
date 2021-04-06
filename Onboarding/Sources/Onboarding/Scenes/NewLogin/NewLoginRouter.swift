//
//  NewLoginRouter.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/6/21.
//

import UIKit

class NewLoginRouter {
    
    weak var view: NewLoginViewController?
    
    
    // MARK: Create Module
    static func createModule() -> UIViewController {
        let view = UIStoryboard(name: "NewLogin", bundle: Bundle.module).instantiateInitialViewController() as! NewLoginViewController
        let interactor = NewLoginInteractor()
        let presenter = NewLoginPresenter()
        let router = NewLoginRouter()
        
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
