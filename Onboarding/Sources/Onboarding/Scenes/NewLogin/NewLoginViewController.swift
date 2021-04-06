//
//  NewLoginViewController.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/6/21.
//

import UIKit

class NewLoginViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var view_card: UIView!
    @IBOutlet weak var view_cpf: BorderedView!
    @IBOutlet weak var lb_cpf: UILabel!
    @IBOutlet weak var field_cpf: UITextField!
    @IBOutlet weak var btn_enter: V8ConfirmButton!
    @IBOutlet weak var constraint_bottomToCardBottom: NSLayoutConstraint!
    
    // MARK: Properties
    var interactor: NewLoginInteractorProtocol?
    private var isSettingUp = true
    private let originalDistanceFromBottom: CGFloat = 24.0
    private var cpfMask: V8Mask!
    
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if isSettingUp {
            UIView.animate(withDuration: 0.3) {
                self.view.backgroundColor = UIColor.black.withAlphaComponent(0.25)
            }
            self.field_cpf.becomeFirstResponder()
        }
        isSettingUp = false
    }
    
    deinit { NotificationCenter.default.removeObserver(self) }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    // MARK: - Setup View Methods
    
    private func delegates() {
        field_cpf.delegate = self
    }
        
    private func setupView() {
        btn_enter.disable()
        
        addKeyboardObserver()
        cpfMask = V8Mask(field_cpf, as: .cpf)
    }
    
    
    // MARK: - Methods
    
    
    
    // MARK: - Button Actions
    
    @IBAction func tapEnterButton(_ sender: UIButton) {
        let request = NewLoginModels.Request(cpf: field_cpf.text?.trimmingCharacters(in: .whitespaces))
        interactor?.enter(request: request)
    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        if field_cpf.isFirstResponder { field_cpf.resignFirstResponder() }
        else {
            self.view.backgroundColor = .clear
            interactor?.closeScreen()
        }
    }
    
}


// MARK: - Access from Presenter
extension NewLoginViewController: NewLoginPresenterDelegate {
    func showEmptyCPF() {
        view_cpf.borderColor = .clear
        lb_cpf.textColor = .black
        lb_cpf.text = " CPF "
        btn_enter.disable()
    }
    
    func showInvalidCPF() {
        view_cpf.borderColor = .v8red
        lb_cpf.textColor = .v8red
        lb_cpf.text = " CPF inválido "
        btn_enter.disable()
    }
    
    func showValidCPF() {
        view_cpf.borderColor = .clear
        lb_cpf.textColor = .black
        lb_cpf.text = " CPF "
        btn_enter.enable()
    }
}


// MARK: - TextField Delegate Methods
extension NewLoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (textField.text ?? "").trimmingCharacters(in: .whitespaces).isEmpty {
            textField.text = ""
        }
        
        let request = NewLoginModels.Request(cpf: field_cpf.text?.trimmingCharacters(in: .whitespaces))
        interactor?.validateInput(request: request)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return cpfMask.shouldChangeCharacters(at: range.location, inputString: string)
    }
}


// MARK: - Keyboard Observer
extension NewLoginViewController {
    func addKeyboardObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillBeHidden),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @objc private func keyboardWillShow(sender notification: Notification) {
        // Find keyboard's height
        guard let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
            else { return }
        
        
        // Scroll for keyboard's height + 8 (considers the safeArea)
        let extraOffset: CGFloat = 8
        let safeAreaBottom = self.view.safeAreaInsets.bottom
        let bottomInset = (keyboardHeight - safeAreaBottom) + extraOffset
        
        UIView.animate(withDuration: 0.4) {
            self.constraint_bottomToCardBottom.constant = bottomInset
            self.view.layoutIfNeeded()
        }
    }

    @objc private func keyboardWillBeHidden(notification: Notification) {
        UIView.animate(withDuration: 0.4) {
            self.constraint_bottomToCardBottom.constant = self.originalDistanceFromBottom
            self.view.layoutIfNeeded()
        }
    }
}
