//
//  ViewController.swift
//  FemaleMusic
//
//  Created by Ferdinand on 08/01/19.
//  Copyright © 2019 Tedjakusuma. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate {
    
    let signInButton: GIDSignInButton = {
        let signIn = GIDSignInButton()
        signIn.translatesAutoresizingMaskIntoConstraints = false
        signIn.style = GIDSignInButtonStyle.standard
        return signIn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        let firebaseAuth = Auth.auth()
        
        if (firebaseAuth.currentUser != nil) {
            do {
                try firebaseAuth.signOut()
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
        }
        NotificationCenter.default.addObserver(self, selector: #selector(didSignIn), name: NSNotification.Name("SuccessfulSignInNotification"), object: nil)
  
    }
    
    @objc func didSignIn()  {
        let homeViewController = HomeViewController()
        self.present(homeViewController, animated: true, completion: nil)        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.view.addSubview(signInButton)
        setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
//            signInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16.0),
            signInButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            signInButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
//            signInButton.widthAnchor.constraint(equalTo: view.widthAnchor),
//            signInButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 9/16),
            ])
    }
}
