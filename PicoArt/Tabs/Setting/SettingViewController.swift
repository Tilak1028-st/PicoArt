//
//  SettingViewController.swift
//  PicoArt
//
//  Created by Tilak Shakya on 31/08/23.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var settingTableView: UITableView!
    
    var settingItems: [String] = ["Support", "Share with Friends", "Privacy Policy", "Term and conditions"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareInitialSetup()
    }
    
    private func prepareInitialSetup() {
        settingTableView.register(UITableViewCell.self, forCellReuseIdentifier: "settingCell")
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath)
        cell.textLabel?.text = settingItems[indexPath.row]
           return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil) // Replace "Main" with your storyboard name
            let destinationViewController = storyboard.instantiateViewController(withIdentifier: "PrivacyPolicyViewController") as! PrivacyPolicyViewController
            
            self.present(destinationViewController, animated: true, completion: nil)
        } else if indexPath.row == 3 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil) // Replace "Main" with your storyboard name
            let destinationViewController = storyboard.instantiateViewController(withIdentifier: "PrivacyPolicyViewController") as! PrivacyPolicyViewController
            
            self.present(destinationViewController, animated: true, completion: nil)
        }
    }
}
