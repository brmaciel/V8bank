//
//  BalanceCollectionViewCell.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/17/21.
//

import UIKit

class BalanceCollectionViewCell: UICollectionViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var lb_title: UILabel!
    @IBOutlet weak var lb_balance: UILabel!
    @IBOutlet weak var btn_showHideBalance: UIButton!
    @IBOutlet weak var lb_action: UILabel!
    
    // MARK: Properties
    var viewModel: BalanceViewModel? {
        didSet {
            lb_title.text = viewModel?.title
            lb_balance.text = viewModel?.balance
            lb_action.text = viewModel?.actionName
        }
    }
    
    // MARK: - Setup View Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    // MARK: - Methods
    
    
    
    // MARK: - Button Actions
    
    @IBAction func tapShowHideBalance(_ sender: UIButton) {
        viewModel?.showHideBalance()
    }
    
    @IBAction func tapDetailsButton(_ sender: UIButton) {
        viewModel?.action()
    }
    
}
