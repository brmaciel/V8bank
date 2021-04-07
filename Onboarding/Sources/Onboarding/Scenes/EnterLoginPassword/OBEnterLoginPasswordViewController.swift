//
//  OBEnterLoginPasswordViewController.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/6/21.
//

import UIKit

class OBEnterLoginPasswordViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var view_card: UIView!
    @IBOutlet var view_passwords: [UIView]!
    @IBOutlet weak var field_password: UITextField!
    @IBOutlet weak var lb_loginFailedMessage: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var constraint_bottomToCardBottom: NSLayoutConstraint!
    @IBOutlet weak var constraint_bottomToSafeArea: NSLayoutConstraint!
    
    // MARK: Properties
    var interactor: OBEnterLoginPasswordInteractorProtocol?
    private var isSettingUp = true
    private let originalDistanceFromBottom: CGFloat = 24.0
    private var heightBelowBottom: CGFloat {
        return 0 - (20 + view_card.frame.height + UIApplication.shared.windows[0].safeAreaInsets.bottom)
    }
    
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if isSettingUp {
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
                self.constraint_bottomToSafeArea.constant = 0
                self.view.layoutIfNeeded()
            } completion: { _ in
                self.field_password.becomeFirstResponder()
            }
        }
        isSettingUp = false
    }
    deinit { NotificationCenter.default.removeObserver(self) }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    // MARK: - Setup View Methods
    
    private func delegates() {
        field_password.delegate = self
    }
        
    private func setupView() {
        field_password.text = " "
        addKeyboardObserver()
        constraint_bottomToSafeArea.constant = self.heightBelowBottom
    }
    
    
    // MARK: - Methods
    
    func dismissView(animated: Bool, completion: (() -> Void)?) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
            self.constraint_bottomToSafeArea.constant = self.heightBelowBottom
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.dismiss(animated: true, completion: completion)
        }
    }
    
    
    // MARK: - Button Actions
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        if field_password.isFirstResponder { field_password.resignFirstResponder() }
        else {
            self.view.backgroundColor = .clear
            interactor?.closeScreen()
        }
    }
    
    @IBAction func tapForgotPasswordButton(_ sender: UIButton) {
        // TODO: forgot password
        print("TODO : forgot password")
    }
    
}


// MARK: - Access from Presenter
extension OBEnterLoginPasswordViewController: OBEnterLoginPasswordPresenterDelegate {
    func showCurrentPassword(viewModel: OBEnterLoginPasswordModels.ViewModel.Password) {
        for (index, view) in view_passwords.enumerated() {
            view.backgroundColor = (index < viewModel.passwordLength) ? .black : .clear
        }
    }
    
    func completedPassword() {
        field_password.resignFirstResponder()
    }
    
    func startRequest() {
        lb_loginFailedMessage.text = nil
        activityIndicator.startAnimating()
    }
    
    func finishRequest() {
        activityIndicator.stopAnimating()
    }
    
    func showLoginDidFailMessage(viewModel: OBEnterLoginPasswordModels.ViewModel.ErrorMessage) {
        lb_loginFailedMessage.text = viewModel.message
    }
}


// MARK: - TextField Delegate Methods
extension OBEnterLoginPasswordViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let request = OBEnterLoginPasswordModels.Request(enteredPassword: string)
        interactor?.enterCharacter(request: request)
        
        return false
    }
}


// MARK: - Keyboard Observer
extension OBEnterLoginPasswordViewController {
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
