//
//  PrivacyPolicyViewController.swift
//  PicoArt
//
//  Created by Tilak Shakya on 31/08/23.
//

import UIKit
import WebKit

class PrivacyPolicyViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var privacyWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "https://sites.google.com/view/post-saversaver-for-instagram/home?authuser=4") {
            let request = URLRequest(url: url)
            privacyWebView.navigationDelegate = self
            privacyWebView.load(request)
        }
    }
}
