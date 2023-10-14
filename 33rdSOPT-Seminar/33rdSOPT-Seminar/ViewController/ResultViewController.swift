//
//  SecondViewController.swift
//  33rdSOPT-Seminar
//
//  Created by 지희의 MAC on 2023/10/07.
//

import UIKit

class ResultViewController: UIViewController {
    // MARK: - Variables
    // MARK: Property
    var delegate: GetDataProtocol?
    var loginDataCompletion: (([String]) -> Void)?
    
    var id: String = ""
    var password: String = ""
    var temp: Int = 0
    
    // MARK: Component
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    // MARK: - Function
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundBlack
        bindText()
    }
    
    // MARK: Custom Function
    private func bindText() {
        self.tempLabel.text = "당신의 열정온도는 \(temp)도 입니다🔥 최고!"
        self.emailLabel.text = "✅ ID :  \(id)"
        self.passwordLabel.text = "🔒 password : \(password)"
    }
    
    // MARK: Action
    @IBAction func backButtonTapped(_ sender: Any) {
        if self.navigationController != nil {
            self.navigationController?.popViewController(animated: true)
        } else {
            self.dismiss(animated: true)
        }
        delegate?.getLoginData(email: self.id,
                               password: self.password)
        
        guard let loginDataCompletion else {return}
        loginDataCompletion([self.id, self.password])

    }
    
    func setLabelText(temp: Int, id: String, password: String) {
        self.temp = temp
        self.id = id
        self.password = password
    }
    
}
