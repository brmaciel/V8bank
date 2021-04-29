//
//  OperationOptionCollectionViewCell.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/29/21.
//

import UIKit

class OperationOptionCollectionViewCell: UICollectionViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var imgview_operation: UIImageView!
    @IBOutlet weak var lb_operationName: UILabel!
    
    // MARK: Properties
    var viewModel: MainMenuModels.ViewModel.OperationOptions.OperationOptionViewModel? {
        didSet {
            imgview_operation.image = viewModel?.image
            lb_operationName.text = viewModel?.name
        }
    }
    
    
    // MARK: - Setup View Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    // MARK: - Methods
    
    

}
