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
    
    
    
}
