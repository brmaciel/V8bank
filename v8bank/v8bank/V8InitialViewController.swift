//
//  V8InitialViewController.swift
//  v8bank
//
//  Created by Bruno Maciel on 4/7/21.
//

import UIKit
import Onboarding

class V8InitialViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var lb_title: UILabel!
    @IBOutlet weak var constraint_titleCenterY: NSLayoutConstraint!

    // MARK: Properties
    private var isSettingUp = true
    
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if isSettingUp { animateTitleToTop() }
        isSettingUp = false
    }
    
    
    // MARK: - Setup View Methods
    
    private func setupView() {
        NotificationCenter.default.addObserver(self, selector: #selector(didLogin), name: NSNotification.Name("onboarding.didLogin"), object: nil)
    }
    
    
    // MARK: - Methods
    
    func animateTitleToTop() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            self.constraint_titleCenterY.priority = UILayoutPriority(rawValue: 1)
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.presentOnboarding()
        }
    }
    
    func presentOnboarding() {
        let destinationVC = OBInitialScreenRouter.createModule()
        present(destinationVC, animated: true, completion: {
            self.view.backgroundColor = UIColor(red: 138/255, green: 142/255, blue: 142/255, alpha: 1.0)
            self.lb_title.textColor = .black
        })
    }
    
    // MARK: - Observer Methods
    
    @objc func didLogin() {
        performSegue(withIdentifier: "goToMainMenu", sender: nil)
    }

}
