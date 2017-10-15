//
//  LoginViewController.swift
//  Research
//
//  Created by Siyang Liu on 2017/8/6.
//  Copyright © 2017年 Siyang Liu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        let userDefaults = UserDefaults.standard
        if let _ = userDefaults.string(forKey: "email"), let _ = userDefaults.string(forKey: "password") {
            loginButtonClick()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            loginButtonClick()
        }
        
        return true
    }
    
    @IBAction func loginButtonClick() {
        view.endEditing(true)
        activityIndicator.startAnimating()
        
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSomething), userInfo: nil, repeats: false)
//        timer.fire()
        
//        let userDefaults = UserDefaults.standard
//        userDefaults.set(emailTextField.text!, forKey: "email")
//        userDefaults.set(passwordTextField.text!, forKey: "password")
//        userDefaults.synchronize()
        
    }
    
    func doSomething() {
        activityIndicator.stopAnimating()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController()
        
        present(viewController!, animated: true)
    }


}
