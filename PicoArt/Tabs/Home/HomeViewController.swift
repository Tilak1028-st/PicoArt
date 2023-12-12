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
    
    @IBOutlet weak var topView: UIView!
    var newImage = ["hat1", "hat2", "hat3", "hat4", "hat5", "hat6", "hat7", "hat8", "hat9", "hat10", "beard"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topView.applyShadow(to: topView, shadowOffset: CGSize(width: 0, height: 1), shadowRadius: 1)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    @IBAction func didTapOnBackButton(_ sender: Any) {
        let settingVc = self.storyboard?.instantiateViewController(identifier: "MainViewController") as! MainViewController
        self.navigationController?.pushViewController(settingVc, animated: true)
    }
    
    @IBAction func didTapOnImportPicture(_ sender: UIButton) {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            pickImageFromLibrary()
            
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { [weak self] status in
                if status == .authorized {
                    self?.pickImageFromLibrary()
                } else {
                    self?.showPermissionDeniedAlert()
                    print("Permission denied to access the photo library.")
                }
            }
            
        case .denied, .restricted:
            showPermissionDeniedAlert()
            print("Permission denied to access the photo library.")
        @unknown default:
            break
        }
    }
    
    func pickImageFromLibrary() {
        DispatchQueue.main.async {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func showPermissionDeniedAlert() {
        let alertController = UIAlertController(
            title: "Permission Denied",
            message: "To edit images, please allow access to your photo library in Settings.",
            preferredStyle: .alert
        )
        
        alertController.addAction(UIAlertAction(
            title: "Cancel",
            style: .cancel,
            handler: nil
        ))
        
        alertController.addAction(UIAlertAction(
            title: "Settings",
            style: .default,
            handler: { _ in
                if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(settingsURL)
                }
            }
        ))
        present(alertController, animated: true, completion: nil)
    }
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
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
            photoEditor.modalPresentationStyle = .fullScreen
            self.present(photoEditor, animated: true, completion: nil)
        }
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
        self.navigationController?.popViewController(animated: true)
    }
}


