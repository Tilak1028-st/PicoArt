//
//  ViewController.swift
//  PicoArt
//
//  Created by Tilak Shakya on 26/08/23.
//

import UIKit
import iOSPhotoEditor
import Photos

class ViewController: UIViewController {
    var newImage = ["hat1", "hat2", "hat3", "hat4", "hat5", "hat6", "hat7", "hat8", "hat9", "hat10", "beard"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
       // photoEditor.stickers.append(UIImage(named: "hat1")!)

        //Optional: To hide controls - array of enum control
     //   photoEditor.hiddenControls = [.crop, .draw, .share]

        //Optional: Colors for drawing and Text, If not set default values will be used
    }
    
    
    func pickImageFromLibrary() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }

    
    @IBAction func didTapOnImportImage(_ sender: UIButton) {
        pickImageFromLibrary()
    }
    
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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


extension ViewController: PhotoEditorDelegate {
    func doneEditing(image: UIImage) {
        print("Done")
    }
    
    func canceledEditing() {
        print("Cancel")
    }
}

