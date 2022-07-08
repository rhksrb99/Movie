//
//  SearchResultViewController.swift
//  Movie
//
//  Created by 박관규 on 2022/07/05.
//

import UIKit
import WebKit

class SearchResultViewController: UIViewController {

    @IBOutlet weak var wv_result: WKWebView!
    var result: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(result)
        loadWebPage("https://movie.naver.com")
//        loadWebPage("https://movie.naver.com/movie/search/result.naver?query=\(result)&section=all")
    }
    
    private func loadWebPage(_ url: String){
        guard let myUrl = URL(string: url) else{
            return
        }
        let request = URLRequest(url: myUrl)
        wv_result.load(request)
    }
    
    


}
