//
//  LoginViewController.swift
//  Research
//
//  Created by Siyang Liu on 2017/8/6.
//  Copyright © 2017年 Siyang Liu. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var invitationIdTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.delegate = self
        invitationIdTextField.delegate = self
        passwordTextField.delegate = self
        repeatPasswordTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            invitationIdTextField.becomeFirstResponder()
        } else if textField == invitationIdTextField {
            passwordTextField.becomeFirstResponder()
        }
        else if textField == passwordTextField {
            repeatPasswordTextField.becomeFirstResponder()
        } else if textField == repeatPasswordTextField {
            signUpButtonClick()
        }
        
        return true
    }
    
    @IBAction func signUpButtonClick() {
        view.endEditing(true)
        
        let email = emailTextField.text!
        let id = invitationIdTextField.text!
        let password = passwordTextField.text!
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(email, forKey: "email")
        userDefaults.set(password, forKey: "password")
        userDefaults.synchronize()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController()
        
        let manager = AFHTTPSessionManager()
        let params = ["email": email, "id": id, "password": password]
        
        manager.post(NetworkUrl.register, parameters: params, progress: nil, success: { (task, data) in
            
        }) { (task, error) in
            
        }
        
        present(viewController!, animated: true)
//        dismiss(animated: true, completion: nil)
    }

    @IBAction func cancelButtonClick() {
        dismiss(animated: true, completion: nil)
    }

}
