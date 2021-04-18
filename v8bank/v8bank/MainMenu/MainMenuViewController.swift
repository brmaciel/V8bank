//
//  MainMenuViewController.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/17/21.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var lb_userName: UILabel!
    @IBOutlet weak var collectionView_balances: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: Properties
    var interactor: MainMenuInteractorProtocol?
    var viewModel: MainMenuModels.ViewModel?
    
    
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
    }
        
    private func setupView() {
        lb_userName.text = "Bruno"
        
        collectionView_balances.register(UINib(nibName: "BalanceCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "balanceCell")
        setCollectionViewCellSize(for: collectionView_balances)
        
        interactor?.viewDidLoad()
    }
    
    private func setCollectionViewCellSize(for collectionView: UICollectionView) {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40,
                                 height: collectionView.frame.height)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 8
        collectionView.collectionViewLayout = layout
    }
    
    
    // MARK: - Methods
    
    
    
    // MARK: - Button Actions
    
    @IBAction func tapUserButton(_ sender: UIButton) {
        print("TODO: go to user")
    }
    
}


// MARK: - Access from Presenter
extension MainMenuViewController: MainMenuPresenterDelegate {
    func startRequest() {
        activityIndicator.startAnimating()
    }
    
    func finishRequest() {
        activityIndicator.stopAnimating()
    }
    
    func showBalances(viewModel: MainMenuModels.ViewModel) {
        self.viewModel = viewModel
        collectionView_balances.reloadData()
    }
}


// MARK: - CollectionView Methods
extension MainMenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numBalances ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "balanceCell", for: indexPath) as! BalanceCollectionViewCell
        cell.viewModel = viewModel?.balance(at: indexPath.row)
        
        return cell
    }
}
