//
//  SecondViewController.swift
//  33rdSOPT-Seminar
//
//  Created by 지희의 MAC on 2023/10/07.
//

import UIKit

class ResultViewController: UIViewController {
    var delegate: GetDataProtocol?
    var loginDataCompletion: (([String]) -> Void)? //스트링 타입의 배열을 매개변수로 전달 할거고, 리턴타입은 void다! 
    
    var email: String = ""
    var password: String = ""
    
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    
    private func bindText() {
        self.emailLabel.text = "email : \(email)"
        self.passwordLabel.text = "password : \(password)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindText()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        if self.navigationController != nil {
            self.navigationController?.popViewController(animated: true)
        } else {
            self.dismiss(animated: true)
        }
        delegate?.getLoginData(email: self.email,
                               password: self.password)
        
        guard let loginDataCompletion else {return}
        loginDataCompletion([self.email, self.password])

    }
    
    func setLabelText(id: String, password: String) {
        email = id
        self.password = password
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
