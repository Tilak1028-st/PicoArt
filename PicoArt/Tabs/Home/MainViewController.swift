//
//  MainViewController.swift
//  PicoArt
//
//  Created by Tilak Shakya on 22/09/23.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didtapOnEdit(_ sender: Any) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true, completion: nil)
        }
    }
    
    private func shareSheet() {
       
    }
    
    @IBAction func didTapOnShare(_ sender: Any) {
        // 6474173402
        let av = UIActivityViewController(activityItems: ["https://apps.apple.com/app/6474173402"], applicationActivities: nil)
        // Set the anchor point for iPad
        if let popoverController = av.popoverPresentationController {
            popoverController.sourceView = UIApplication.shared.windows.first
            popoverController.sourceRect = CGRect(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
    }
    
    
    @IBAction func didTapOnAboutUs(_ sender: Any) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AboutUsViewController") as? AboutUsViewController {
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true, completion: nil)
        }
    }

    
    
    @IBAction func didTapOnPrivacyPolicy(_ sender: Any) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PrivacyPolicyViewController") as? PrivacyPolicyViewController {
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func didTapOnTerms(_ sender: Any) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TermAndConditionViewController") as? TermAndConditionViewController {
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true, completion: nil)
        }
    }
    
    
}
