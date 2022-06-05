//
//  Login.swift
//  json
//
//  Created by Bachana Sanadiradze on 05.06.22.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var mailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var singInOutlet: UIButton!
    
    let userMail = "buchdrum@gmail.com"
    let userPassword = "bachana"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mailField.delegate = self
        passwordField.delegate = self
        
        mailField.clearButtonMode = .always
        mailField.clearButtonMode = .whileEditing
        mailField.layer.cornerRadius = 15
        mailField.clipsToBounds = true
        
        passwordField.clearButtonMode = .always
        passwordField.clearButtonMode = .whileEditing
        passwordField.layer.cornerRadius = 15
        passwordField.clipsToBounds = true
        singInOutlet.layer.cornerRadius = 15
        singInOutlet.clipsToBounds = true
        
        
    }
    
  
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.mailField.resignFirstResponder()
        self.passwordField.resignFirstResponder()
        return true
    }

    func alertFunc() {
        let alert = UIAlertController(title: "შეცდომა", message: "სწორად შეავსეთ ველი", preferredStyle: .alert)
        let buttonAllert = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(buttonAllert)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func singIn(_ sender: UIButton) {
        
        if mailField.text == userMail && passwordField.text == userPassword {
            let nextViewController = storyboard?.instantiateViewController(withIdentifier: "ViewController")
            self.navigationController?.pushViewController(nextViewController!, animated: true)
            
        }else {
            alertFunc()
        }
        
    }
    
}
