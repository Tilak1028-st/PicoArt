//
//  SettingViewController.swift
//  PicoArt
//
//  Created by Tilak Shakya on 31/08/23.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var settingTableView: UITableView!
    
    var settingItems: [String] = ["About us", "Support", "Share with Friends", ]
    
    var privarySettingItems : [String] = ["Privacy Policy", "Term and conditions"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareInitialSetup()
    }
    
    private func prepareInitialSetup() {
        settingTableView.register(UITableViewCell.self, forCellReuseIdentifier: "settingCell")
        topView.applyShadow(to: topView, shadowOffset: CGSize(width: 0, height: 3), shadowRadius: 3)
    }
    
    private func shareSheet() {
        let av = UIActivityViewController(activityItems: ["https://apps.apple.com/app/6461165758"], applicationActivities: nil)
        // Set the anchor point for iPad
        if let popoverController = av.popoverPresentationController {
            popoverController.sourceView = UIApplication.shared.windows.first
            popoverController.sourceRect = CGRect(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return settingItems.count
        } else if section == 1 {
            return privarySettingItems.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath)
        if indexPath.section ==  0 {
            cell.textLabel?.text = settingItems[indexPath.row]
        } else {
            cell.textLabel?.text = privarySettingItems[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if indexPath.row == 1 {
                let emailURL = URL(string: "mailto:\("tilak.shakya@hotmail.com")")!
                UIApplication.shared.open(emailURL)
            } else if indexPath.row == 1 {
                self.shareSheet()
            }
        } else {
            if indexPath.row == 0 {
                let storyboard = UIStoryboard(name: "Main", bundle: nil) // Replace "Main" with your storyboard name
                let destinationViewController = storyboard.instantiateViewController(withIdentifier: "PrivacyPolicyViewController") as! PrivacyPolicyViewController
                
                self.present(destinationViewController, animated: true, completion: nil)
            } else if indexPath.row == 1 {
                let storyboard = UIStoryboard(name: "Main", bundle: nil) // Replace "Main" with your storyboard name
                let destinationViewController = storyboard.instantiateViewController(withIdentifier: "PrivacyPolicyViewController") as! PrivacyPolicyViewController
                
                self.present(destinationViewController, animated: true, completion: nil)
            }
        }
    }
}
