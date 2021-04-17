//
//  MainMenuRouter.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/17/21.
//

import UIKit

class MainMenuRouter {
    
    weak var view: MainMenuViewController?
    
    
    // MARK: Create Module
    static func createModule() -> UIViewController {
        let view = UIStoryboard(name: "MainMenu", bundle: Bundle(for: MainMenuViewController.self)).instantiateInitialViewController() as! MainMenuViewController
        let interactor = MainMenuInteractor()
        let presenter = MainMenuPresenter()
        let router = MainMenuRouter()
        let worker = MainMenuWorker()
        
        view.interactor = interactor
        interactor.presenter = presenter
        interactor.router = router
        interactor.worker = worker
        presenter.view = view
        router.view = view
        
        return view
    }
    
    
    // MARK: - Routing
    
    
    
}
