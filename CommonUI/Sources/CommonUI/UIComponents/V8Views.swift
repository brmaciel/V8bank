//
//  V8Views.swift
//  
//
//  Created by Bruno Maciel on 4/7/21.
//

import UIKit

@IBDesignable public class BorderedView: UIView {
    @IBInspectable public var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    @IBInspectable public var borderColor: UIColor = .clear {
        willSet { layer.borderColor = newValue.cgColor }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 1.0 {
        willSet { layer.borderWidth = newValue }
    }
    
}


public class UpperRoundedCard: UIView {
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
