//
//  SignUpViewController.swift
//  Movie
//
//  Created by 박관규 on 2022/07/06.
//

import UIKit

//extension SignUpViewController: UIViewController, UITextFieldDelegate{
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.tf_email.delegate = self
//        self.tf_password.delegate = self
//        self.tf_nickName.delegate = self
//        self.tf_country.delegate = self
//        self.tf_code.delegate = self
//    }
//
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {return true}
//}

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var lb_title: UILabel!
    
    @IBOutlet weak var tf_email: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    @IBOutlet weak var tf_nickName: UITextField!
    @IBOutlet weak var tf_country: UITextField!
    @IBOutlet weak var tf_code: UITextField!
    
    @IBOutlet weak var btn_signIn: UIButton! {
        // 버튼의 초기 상태 지정
        didSet {
            // 버튼 비활성화
            btn_signIn.isEnabled = false
        }
    }
    @IBOutlet weak var lb_info: UILabel!
    @IBOutlet weak var btn_switch: UISwitch!
    
    @IBOutlet weak var lb_emailWarning: UILabel!
    @IBOutlet weak var lb_passwordWarning: UILabel!
    @IBOutlet weak var lb_codeWarning: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        designLabel(lbName: lb_title, lbtext: "GYUFLIX", lbtextColor: .red)
        designTextField(tfName: tf_email, placeHolder: "이메일 주소 또는 전화번호", keyboardType: .emailAddress)
        designTextField(tfName: tf_password, placeHolder: "비밀번호", keyboardType: .default)
        tf_password.isSecureTextEntry = true
        designTextField(tfName: tf_nickName, placeHolder: "닉네임",  keyboardType: .default)
        designTextField(tfName: tf_country, placeHolder: "위치",keyboardType: .default)
        designTextField(tfName: tf_code, placeHolder: "추천 코드 입력", keyboardType: .numberPad)
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
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {return true}
        
    }
    
    // MARK: - Function
    func designTextField(tfName:UITextField, placeHolder:String , keyboardType:UIKeyboardType){
        tfName.textAlignment = .center
        tfName.layer.cornerRadius = 5
        tfName.keyboardType = keyboardType
        tfName.textColor = .white
        tfName.backgroundColor = .darkGray
        // placeholder를 지정하며 색 변경도 할 수있는 코드.
        tfName.attributedPlaceholder = NSAttributedString(string: "\(placeHolder)", attributes: [.foregroundColor: UIColor.systemMint])
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // 입력되는 값을 데이터로 받아와 조건으로 활용하기.
        if range.location == 0 && range.length != 0 {
            self.btn_signIn.isEnabled = false
        }else {
            self.btn_signIn.isEnabled = true
        }
        print("range:", range) // range: {0, 0} 이런 형태로 값을 받아올 수 있다.
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
            // 입력한 코드를 int로 형변환 했을 때 nil이라면 (= int값이 없다면)
            if Int(codeNum) == nil || codeNum.count <= 0{
                lb_codeWarning.text = "숫자만 입력 가능하며 입력은 필수입니다."
                lb_codeWarning.textColor = .red
            }else{
                lb_codeWarning.text = ""
            }
        }
        
        
        // 제약조건을 설정해 입력 값중 하나라도 올바르지 않을 때와 올바를 때를
        // 조건에 따라 각각 띄워주기
        
        // 회원가입 클릭 시 작성한 Email과 NickName을 alert에 띄워주며
        // 재확인하는 기능 생성
        let alert = UIAlertController(title: "알림", message: "입력하신 Email과 NickName이\n이메일 : \(tf_email.text!)\n닉네임 : \(tf_nickName.text!)입니까?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "취소", style: .default))
        alert.addAction(UIAlertAction(title: "확인", style: .default){ action in
            // 일치하면 다음 화면으로 넘어가기
            let viewChange = self.storyboard?.instantiateViewController(withIdentifier: "ViewController")
            // 화면전환 후 전환 된 화면에 대한 스타일 지정
            viewChange?.modalPresentationStyle = .fullScreen
            self.present(viewChange!, animated: true, completion: nil)
        })
        
        self.present(alert, animated: true, completion: nil)
        
        // 입력한 정보가 올바르지 않을 때 띄워지는 경고.
        let warnningAlert = UIAlertController(title: "알림", message: "정보를 올바르게 입력하세요", preferredStyle: .alert)
        warnningAlert.addAction(UIAlertAction(title: "확인", style: .default))
        self.present(warnningAlert, animated: true, completion: nil)
        
    }
    
    

}
