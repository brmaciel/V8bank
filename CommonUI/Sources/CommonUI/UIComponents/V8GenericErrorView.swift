//
//  V8GenericError.swift
//  
//
//  Created by Bruno Maciel on 4/18/21.
//

import UIKit

public class V8GenericErrorView: UIView {
    let lb_message: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 2
        
        return label
    }()
    
    let btn_tryAgain: V8AuxiliaryButton = {
        let frame = CGRect(x: 0, y: 0, width: 200, height: 36)
        let button = V8AuxiliaryButton(frame: frame)
        button.setTitle("Tentar novamente", for: .normal)
        button.height = 36
        return button
    }()
    
    
    // MARK: Constructor
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    private func setupView() {
        hide()
        backgroundColor = .clear
        setConstraints()
    }
    
    private func setConstraints() {
        addSubview(lb_message)
        addSubview(btn_tryAgain)
        
        lb_message.translatesAutoresizingMaskIntoConstraints = false
        btn_tryAgain.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lb_message.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            lb_message.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            lb_message.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -12),
            
            btn_tryAgain.topAnchor.constraint(equalTo: lb_message.bottomAnchor, constant: 24),
            btn_tryAgain.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            btn_tryAgain.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
    // MARK: - Public Properties & Methods
    
    public var message: String? {
        get { return lb_message.text }
        set { lb_message.text = newValue }
    }
    
    public var messageTextColor: UIColor {
        get { return lb_message.textColor }
        set { lb_message.textColor = newValue }
    }
    
    public func setTryAgainAction(_ action: Selector, target: Any) {
        btn_tryAgain.addTarget(target, action: action, for: .touchUpInside)
    }
    
    public func show() {
        isHidden = false
    }
    
    public func hide() {
        isHidden = true
    }
    
}
