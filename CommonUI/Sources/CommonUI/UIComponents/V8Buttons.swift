//
//  V8Buttons.swift
//  
//
//  Created by Bruno Maciel on 4/7/21.
//

import UIKit

public class V8MainButton: UIButton {
    
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

public class V8ConfirmButton: V8MainButton {
    
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
        
        backgroundColor = UIColor.v8yellow
        setTitleColor(.black, for: .normal)
        setTitleColor(UIColor.v8darkGrayText, for: .disabled)
    }
    
    public func enable() {
        isEnabled = true
        backgroundColor = UIColor.v8yellow
    }
    
    public func disable() {
        isEnabled = false
        backgroundColor = UIColor.v8disabledButtonBackground
    }
    
}

public class V8AuxiliaryButton: V8MainButton {
    
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
        layer.borderColor = UIColor.v8lightGray.cgColor
        
        setTitleColor(.v8darkGrayText, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 15.0, weight: .medium)
    }
    
}
