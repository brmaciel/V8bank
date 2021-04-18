//
//  TRBankStatementTableViewCell.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/18/21.
//

import UIKit

class TRBankStatementTableViewCell: UITableViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var lb_title: UILabel!
    @IBOutlet weak var lb_subtitle: UILabel!
    @IBOutlet weak var lb_value: UILabel!
    
    // MARK: Properties
    var viewModel: BankStatementModels.ViewModel.StatementViewModel? {
        didSet {
            lb_title.text = viewModel?.title
            lb_subtitle.text = viewModel?.subtitle
            lb_value.text = viewModel?.value
        }
    }
    
    // MARK: - Setup View
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
