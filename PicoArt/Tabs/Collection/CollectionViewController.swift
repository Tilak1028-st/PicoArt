//
//  CollectionViewController.swift
//  PicoArt
//
//  Created by Tilak Shakya on 31/08/23.
//

import UIKit

class CollectionViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var collectionTableView: UITableView!
    @IBOutlet weak var topView: UIView!
    
    // MARK: Variable
    var animals: [String] = ["Horse", "Cow", "Camel", "Sheep", "Goat"]
    var isFromPhotoEdit: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareInitialView()
    }
    
    private func prepareInitialView() {
        collectionTableView.register(UINib(nibName: "CollectionTableViewCell", bundle: nil), forCellReuseIdentifier: "collectionCell")
        topView.applyShadow(to: topView, shadowOffset: CGSize(width: 0, height: 3), shadowRadius: 3)
    }
    
    
    @IBAction func didTapOnAddCollection(_ sender: UIButton) {
        let alert = UIAlertController(title: "PicoArt", message: "Enter name of the collection", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Collection Name"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            if let title = textField?.text {
                self.animals.append(title)
                self.collectionTableView.reloadData()
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension CollectionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = collectionTableView.dequeueReusableCell(withIdentifier: "collectionCell", for: indexPath) as! CollectionTableViewCell
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension UIView {
    func applyShadow(to view: UIView, shadowOffset: CGSize, shadowRadius: CGFloat) {
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = shadowOffset
        view.layer.shadowRadius = shadowRadius
        
        // Create a shadow path to specify the area where the shadow should appear (only the bottom in this case)
        let shadowPath = UIBezierPath(rect: CGRect(x: 0, y: view.frame.height - shadowOffset.height, width: view.frame.width, height: shadowOffset.height))
        view.layer.shadowPath = shadowPath.cgPath
    }
}
