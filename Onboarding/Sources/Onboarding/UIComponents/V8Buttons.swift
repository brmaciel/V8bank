//
//  V8Buttons.swift
//  
//
//  Created by Bruno Maciel on 4/6/21.
//

import UIKit

class V8MainButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    fileprivate func setupView() {
        let height: CGFloat = 48.0
        heightAnchor.constraint(equalToConstant: height).isActive = true
        layer.cornerRadius = height / 2
    }
    
}

class V8ConfirmButton: V8MainButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    final fileprivate override func setupView() {
        super.setupView()
        
        backgroundColor = UIColor(red: 254/255, green: 208/255, blue: 49/255, alpha: 1.0)
        setTitleColor(.black, for: .normal)
    }
    
}

class V8AuxiliaryButton: V8MainButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    final fileprivate override func setupView() {
        super.setupView()
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        
        setTitleColor(.darkGray, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 15.0, weight: .medium)
    }
    
}
