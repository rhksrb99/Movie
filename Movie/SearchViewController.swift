//
//  SearchViewController.swift
//  Movie
//
//  Created by 박관규 on 2022/07/05.
//

import UIKit
import WebKit

class SearchViewController: UIViewController {

    
    @IBOutlet weak var tf_search: UITextField!
    @IBOutlet weak var btn_search: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    // textfield에 입력받은 텍스트를 검색 버튼 클릭 시
    // 네이버로 연결하여 검색결과 보여주기.
    @IBAction func btn_searchClicked(_ sender: UIButton) {
        guard let searchResult = self.storyboard?.instantiateViewController(withIdentifier: "SearchResultViewController") as? SearchResultViewController else {
            return
        }
        
        searchResult.result = tf_search.text!
        self.present(searchResult, animated: false)
    }
    
}
