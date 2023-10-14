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
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var tempSlider: UISlider!
    
    // MARK: - Function
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
    }
    
    func setStyle(){
        view.backgroundColor = .backgroundBlack
        loginButton.layer.cornerRadius = 6
    }
    
    
    func pushToResultVC() {
        guard let resultVC = self.storyboard?.instantiateViewController(identifier: "ResultVC") as? ResultViewController else {return}
        resultVC.setLabelText(temp: Int(tempSlider.value),id: self.idText,
                              password: self.passwordText)
        self.navigationController?.pushViewController(resultVC, animated: true)
        resultVC.loginDataCompletion = { data in
            print("클로저로 받아온 email : \(data[0]), 클로저로 받아온 password : \(data[1])")
        }
    }
    
    func presentToResultVC() {
        guard let resultVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultVC") as? ResultViewController else {return}
        resultVC.id = idText
        resultVC.password = passwordText
        self.present(resultVC, animated: true)
    }
    
    // MARK: Action
    
    @IBAction func tempSliderChanged(_ sender: Any) {
        tempLabel.text = "열정온도 \(Int(tempSlider.value))도🔥"
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        self.idText = idTextField.text ?? ""
        self.passwordText = passwordTextField.text ?? ""
        
        print("\(idText)\n\(passwordText)")
        if tempSlider.value < 100 {
            view.showToast(message: "열정 온도가 너무 낮아요! \n 100도 이상만 출입 가능해요")
        } else if idText == "" || passwordText == "" {
            view.showToast(message: "아이디와 비밀번호를 확인해주세요")
        } else {
            pushToResultVC()
        }
    }
    
    
}

extension ViewController: GetDataProtocol {
    func getLoginData(email: String, password: String) {
        print("받아온 email : \(email), 받아온 password : \(password)")
    }
}
