//
//  HomeViewController.swift
//  PicoArt
//
//  Created by Tilak Shakya on 31/08/23.
//

import UIKit
import iOSPhotoEditor
import Photos

class HomeViewController: UIViewController {
    var newImage = ["hat1", "hat2", "hat3", "hat4", "beard"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func didTapOnImportPicture(_ sender: UIButton) {
        pickImageFromLibrary()
    }
    
    func pickImageFromLibrary() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            // You have the picked image, you can now navigate to the next view controller
            let photoEditor = PhotoEditorViewController(nibName:"PhotoEditorViewController",bundle: Bundle(for: PhotoEditorViewController.self))

            //PhotoEditorDelegate
            photoEditor.photoEditorDelegate = self

            //The image to be edited
            photoEditor.image = pickedImage

            //Stickers that the user will choose from to add on the image
            for i in newImage {
                photoEditor.stickers.append(UIImage(named: i)!)
            }
            
            photoEditor.colors = [.red,.blue,.green, .orange, .yellow, .black, .brown, .cyan, .gray, .magenta, .purple, .white]

            //Present the View Controller
            self.present(photoEditor, animated: true, completion: nil)
            self.navigationController?.pushViewController(photoEditor, animated: true)
        }
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}


extension HomeViewController: PhotoEditorDelegate {
    func doneEditing(image: UIImage) {
        print("Done")
    }
    
    func canceledEditing() {
        print("Cancel")
    }
}


