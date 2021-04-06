//
//  File.swift
//  
//
//  Created by Bruno Maciel on 4/6/21.
//

import UIKit

@IBDesignable class BorderedView: UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        willSet { layer.borderColor = newValue.cgColor }
    }
    
    @IBInspectable var borderWidth: CGFloat = 1.0 {
        willSet { layer.borderWidth = newValue }
    }
    
}


class UpperRoundedCard: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    
    private func setupView() {
        layer.cornerRadius = 16
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}
