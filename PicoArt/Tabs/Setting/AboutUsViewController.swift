//
//  AboutUsViewController.swift
//  PicoArt
//
//  Created by Tilak Shakya on 22/09/23.
//

import UIKit

class AboutUsViewController: UIViewController {

    @IBOutlet weak var aboutUsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didTaponBackButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}

extension AboutUsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = aboutUsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}
