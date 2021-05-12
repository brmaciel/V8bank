//
//  TRTransactionDetailsRouter.swift
//  v8bank
//
//  Created by Bruno Maciel on 5/12/21.
//

import UIKit

class TRTransactionDetailsRouter {
    
    weak var view: TRTransactionDetailsViewController?
    
    
    // MARK: Create Module
    static func createModule() -> UIViewController {
        let view = UIStoryboard(name: "TransactionDetails", bundle: Bundle.module).instantiateInitialViewController() as! TRTransactionDetailsViewController
        let interactor = TRTransactionDetailsInteractor()
        let presenter = TRTransactionDetailsPresenter()
        let router = TRTransactionDetailsRouter()
        
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
