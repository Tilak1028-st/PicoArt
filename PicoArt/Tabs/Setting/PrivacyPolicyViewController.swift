//
//  PrivacyPolicyViewController.swift
//  PicoArt
//
//  Created by Tilak Shakya on 31/08/23.
//

import UIKit

class PrivacyPolicyViewController: UIViewController {

    @IBOutlet weak var privacyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func didTapOnBackButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}

extension PrivacyPolicyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = privacyTableView.dequeueReusableCell(withIdentifier: "privacyCell", for: indexPath)
        return cell
    }
}
