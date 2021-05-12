//
//  BankStatementRouter.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/18/21.
//

import UIKit

public class BankStatementRouter {
    
    weak var view: BankStatementViewController?
    
    
    // MARK: Create Module
    public static func createModule() -> UIViewController {
        let view = UIStoryboard(name: "BankStatement", bundle: Bundle.module).instantiateInitialViewController() as! BankStatementViewController
        let interactor = BankStatementInteractor()
        let presenter = BankStatementPresenter()
        let router = BankStatementRouter()
        let worker = BankStatementWorker()
        
        view.interactor = interactor
        interactor.presenter = presenter
        interactor.router = router
        interactor.worker = worker
        presenter.view = view
        router.view = view
        
        return view
    }
    
    
    // MARK: - Routing
    
    func goToTransactionDetails() {
        let destinationVC = TRTransactionDetailsRouter.createModule()
        view?.present(destinationVC, animated: true, completion: nil)
    }
    
    func dismissView() {
        view?.dismiss(animated: true, completion: nil)
    }
    
}
