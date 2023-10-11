//
//  ViewController.swift
//  33rdSOPT-Seminar
//
//  Created by 지희의 MAC on 2023/10/07.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables
    // MARK: Property
    var idText: String = ""
    var passwordText: String = ""
    
    // MARK: Component
    @IBOutlet weak var loginButton: UIButton!
    
    
    // MARK: - Function
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func pushToResultVC() {
            guard let resultVC = self.storyboard?.instantiateViewController(identifier: "ResultVC") as? ResultViewController else {return}
            resultVC.setLabelText(id: self.idText,
                                  password: self.passwordText)
            self.navigationController?.pushViewController(resultVC, animated: true)
            resultVC.loginDataCompletion = { data in
                print("클로저로 받아온 email : \(data[0]), 클로저로 받아온 password : \(data[1])")
            }
    }
        
    func presentToResultVC() {
        guard let resultVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultVC") as? ResultViewController else {return}
        resultVC.email = idText
        resultVC.password = passwordText
        self.present(resultVC, animated: true)
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        print("\(idText)\n\(passwordText)")
        pushToResultVC()
    }
    
    @IBAction func idTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let idText = textField.text {
            self.idText = idText
            print(idText)
        }
        
    }
    
    @IBAction func passwordTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let passwordText = textField.text {
            self.passwordText = passwordText
            print(passwordText)
        }
    }
    
    
}

extension ViewController: GetDataProtocol {
    func getLoginData(email: String, password: String) {
        print("받아온 email : \(email), 받아온 password : \(password)")
    }
}
