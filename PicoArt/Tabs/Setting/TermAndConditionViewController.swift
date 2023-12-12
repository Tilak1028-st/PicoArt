//
//  TermAndConditionViewController.swift
//  PicoArt
//
//  Created by Tilak Shakya on 31/08/23.
//

import UIKit

class TermAndConditionViewController: UIViewController {

    @IBOutlet weak var termTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapOnBackButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}

extension TermAndConditionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = termTableView.dequeueReusableCell(withIdentifier: "termCell", for: indexPath)
        return cell
    }
}
