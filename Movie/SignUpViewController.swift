//
//  SignUpViewController.swift
//  Movie
//
//  Created by 박관규 on 2022/07/06.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var lb_title: UILabel!
    @IBOutlet weak var tf_email: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    @IBOutlet weak var tf_nickName: UITextField!
    @IBOutlet weak var tf_country: UITextField!
    @IBOutlet weak var tf_code: UITextField!
    @IBOutlet weak var btn_signIn: UIButton!
    @IBOutlet weak var lb_info: UILabel!
    @IBOutlet weak var btn_switch: UISwitch!
    @IBOutlet weak var lb_emailWarning: UILabel!
    @IBOutlet weak var lb_passwordWarning: UILabel!
    @IBOutlet weak var lb_codeWarning: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        designLabel(lbName: lb_title, lbtext: "GYUFLIX", lbtextColor: .red)
        designTextField(tfName: tf_email, placeHolder: "이메일 주소 또는 전화번호", textColor: .white, bgColor: .darkGray, keyboardType: .emailAddress)
        designTextField(tfName: tf_password, placeHolder: "비밀번호", textColor: .white, bgColor: .darkGray, keyboardType: .default)
        tf_password.isSecureTextEntry = true
        designTextField(tfName: tf_nickName, placeHolder: "닉네임", textColor: .white, bgColor: .darkGray, keyboardType: .default)
        designTextField(tfName: tf_country, placeHolder: "위치", textColor: .white, bgColor: .darkGray, keyboardType: .default)
        designTextField(tfName: tf_code, placeHolder: "추천 코드 입력", textColor: .white, bgColor: .darkGray, keyboardType: .numberPad)
        designButton(buttonName: btn_signIn, btnSetTitle: "회원가입", btnTitleColor: .white, bgColor: .darkGray)
        lb_info.text = "추가 정보 입력"
        lb_info.textColor = .white
        btn_switch.onTintColor = .red
        
        // 입력 중 return 키 클릭 시 키보드 내려가는 기능 구현을 위해 함수 사용을 위한 delegate 지정
        self.tf_email.delegate = self
        self.tf_password.delegate = self
        self.tf_nickName.delegate = self
        self.tf_country.delegate = self
        self.tf_code.delegate = self
        
    }
    
    // MARK: - Function
    func designTextField(tfName:UITextField, placeHolder:String , textColor:UIColor, bgColor:UIColor, keyboardType:UIKeyboardType){
        tfName.placeholder = placeHolder
        tfName.textColor = textColor
        tfName.textAlignment = .center
        tfName.backgroundColor = bgColor
        tfName.layer.cornerRadius = 5
        tfName.keyboardType = keyboardType
    }
    
    func designLabel(lbName:UILabel, lbtext:String, lbtextColor:UIColor){
        
        lbName.text = lbtext
        lbName.textColor = lbtextColor
        lbName.textAlignment = .center
        lbName.font = .boldSystemFont(ofSize: 40)
    }

    func designButton(buttonName:UIButton, btnSetTitle:String, btnTitleColor:UIColor, bgColor:UIColor){
        buttonName.setTitle(btnSetTitle, for: .normal)
        buttonName.setTitleColor(btnTitleColor, for: .normal)
        buttonName.backgroundColor = bgColor
        buttonName.layer.cornerRadius = 5
        
    }
    
    // 입력 중 return 클릭 시 키보드를 숨기는 함수
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.tf_email{
            tf_email.resignFirstResponder()
        }
        if textField == self.tf_password{
            tf_password.resignFirstResponder()
        }
        if textField == self.tf_nickName{
            tf_nickName.resignFirstResponder()
        }
        if textField == self.tf_country{
            tf_country.resignFirstResponder()
        }
        return true
    }
    
    // MARK: - IBActions
    
    @IBAction func viewTapGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    // 버튼 클릭 시 Email, Password에 대한 상태에 따른 조건별 처리
    // 빈칸인 상태라면 경고에 대한 메시지 띄우기
    @IBAction func btn_signInClicked(_ sender: UIButton) {
        print("SignUpViewController - btn_signInClicked called")
        view.endEditing(true)
        
        if tf_email.text?.isEmpty == true{
            lb_emailWarning.text = "입력은 필수입니다."
            lb_emailWarning.textColor = .red
        }else{
            lb_emailWarning.text = ""
        }
        
        if tf_password.text!.count < 6 || tf_password.text?.isEmpty == true{
            lb_passwordWarning.text = "입력은 필수이며 6자리 이상 입력해야합니다."
            lb_passwordWarning.textColor = .red
        }else {
            lb_passwordWarning.text = ""
        }
        
        if let codeNum = tf_code.text{
            if Int(codeNum) == nil || codeNum.count <= 0{
                lb_codeWarning.text = "숫자만 입력 가능하며 입력은 필수입니다."
                lb_codeWarning.textColor = .red
            }else{
                lb_codeWarning.text = ""
            }
        }
        
    }
    
    

}
