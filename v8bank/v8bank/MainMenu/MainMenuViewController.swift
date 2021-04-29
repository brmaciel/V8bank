//
//  MainMenuViewController.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/17/21.
//

import UIKit
import CommonUI

class MainMenuViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var lb_userName: UILabel!
    @IBOutlet weak var collectionView_balances: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var view_error: V8GenericErrorView!
    @IBOutlet weak var collectionView_operationOptions: UICollectionView!
    
    // MARK: Properties
    var interactor: MainMenuInteractorProtocol?
    var balancesViewModel: MainMenuModels.ViewModel.Balances?
    var operationOptionViewModel: MainMenuModels.ViewModel.OperationOptions?
    
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        setupView()
    }
    
    
    // MARK: - Setup View Methods
    
    private func delegates() {
        collectionView_balances.delegate = self
        collectionView_balances.dataSource = self
        collectionView_operationOptions.delegate = self
        collectionView_operationOptions.dataSource = self
    }
        
    private func setupView() {
        lb_userName.text = "Bruno"
        
        collectionView_balances.register(UINib(nibName: "BalanceCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "balanceCell")
        setBalanceCollectionViewCellSize()
        view_error.setTryAgainAction(#selector(tryAgainFetchingBalances), target: self)
        
        collectionView_operationOptions.register(UINib(nibName: "OperationOptionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "operationOptionCell")
        setOperationOptionsCollectionViewCellSize()
        
        interactor?.viewDidLoad()
    }
    
    private func setBalanceCollectionViewCellSize() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40,
                                 height: collectionView_balances.frame.height)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 8
        collectionView_balances.collectionViewLayout = layout
    }
    
    private func setOperationOptionsCollectionViewCellSize() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        layout.itemSize = CGSize(width: 72, height: 82)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 8
        collectionView_operationOptions.collectionViewLayout = layout
    }
    
    
    // MARK: - Methods
    
    
    
    // MARK: - Button Actions
    
    @IBAction func tapUserButton(_ sender: UIButton) {
        print("TODO: go to user")
    }
    
    @objc func tryAgainFetchingBalances() {
        interactor?.tryAgainFetchingBalances()
    }
    
}


// MARK: - Access from Presenter
extension MainMenuViewController: MainMenuPresenterDelegate {
    func startRequest() {
        view_error.hide()
        activityIndicator.startAnimating()
    }
    
    func finishRequest() {
        activityIndicator.stopAnimating()
    }
    
    func showBalances(viewModel: MainMenuModels.ViewModel.Balances) {
        balancesViewModel = viewModel
        collectionView_balances.reloadData()
    }
    
    func showError() {
        view_error.message = "Fail to retrieve balances\nTry again later"
        view_error.show()
    }
    
    func showOperationOptions(viewModel: MainMenuModels.ViewModel.OperationOptions) {
        operationOptionViewModel = viewModel
        collectionView_operationOptions.reloadData()
    }
}

extension MainMenuViewController: BalanceCellDelegate {
    func presentDetailsScreen(_ view: UIViewController) {
        present(view, animated: true, completion: nil)
    }
}

// MARK: - CollectionView Methods
extension MainMenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
            case collectionView_balances:
                return balancesViewModel?.numBalances ?? 0
            case collectionView_operationOptions:
                return operationOptionViewModel?.numOperations ?? 0
            default:
                return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
            case collectionView_balances:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "balanceCell", for: indexPath) as! BalanceCollectionViewCell
                cell.viewModel = balancesViewModel?.balance(at: indexPath.row)
                cell.delegate = self
                
                return cell
                
            case collectionView_operationOptions:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "operationOptionCell", for: indexPath) as! OperationOptionCollectionViewCell
                cell.viewModel = operationOptionViewModel?.operation(at: indexPath.row)
                
                return cell
                
            default:
                return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard
            collectionView == collectionView_operationOptions,
            let viewController = operationOptionViewModel?.operation(at: indexPath.row)?.action()
            else { return }
        
        present(viewController, animated: true, completion: nil)
    }
}
