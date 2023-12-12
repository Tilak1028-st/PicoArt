//
//  FourthIntroViewController.swift
//  PicoArt
//
//  Created by Tilak Shakya on 12/12/23.
//

import UIKit

class FourthIntroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func didTapOnSkipButton(_ sender: UIButton) {
        UserDefaults.standard.setValue(true, forKey: "isSetupDone")
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let navBarController = UINavigationController(rootViewController: viewController)
        UIApplication.shared.windows.first?.rootViewController = navBarController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    
}
