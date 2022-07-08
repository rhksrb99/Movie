//
//  ViewController.swift
//  Movie
//
//  Created by 박관규 on 2022/07/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var img_main: UIImageView!
    @IBOutlet weak var img_third: UIImageView!
    @IBOutlet weak var img_second: UIImageView!
    @IBOutlet weak var img_first: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.img_main.image = UIImage(named: "영화\(Int.random(in: 1...20))")
        self.img_first.image = UIImage(named: "영화\(Int.random(in: 1...20))")
        self.img_second.image = UIImage(named: "영화\(Int.random(in: 1...20))")
        self.img_third.image = UIImage(named: "영화\(Int.random(in: 1...20))")
        
        
        self.img_first.layer.cornerRadius = img_first.frame.height/2
        self.img_first.layer.borderColor = UIColor.red.cgColor
        
        
        self.img_second.layer.cornerRadius = img_second.frame.height/2
        self.img_second.layer.borderColor = UIColor.orange.cgColor
        
        
        self.img_third.layer.cornerRadius = img_third.frame.height/2
        self.img_third.layer.borderColor = UIColor.yellow.cgColor
        
        
    }
    
    @IBAction func Btn_randomMainImage(_ sender: UIButton) {
        
        img_main.image = UIImage(named: "영화\(Int.random(in:1...20))")
        img_first.image = UIImage(named: "영화\(Int.random(in: 1...20))")
        img_second.image = UIImage(named: "영화\(Int.random(in: 1...20))")
        img_third.image = UIImage(named: "영화\(Int.random(in: 1...20))")
    }
    
}

