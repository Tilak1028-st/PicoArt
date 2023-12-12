//
//  PhotoEditor+Crop.swift
//  Pods
//
//  Created by Mohamed Hamed on 6/16/17.
//
//

import Foundation
import UIKit

// MARK: - CropView
extension PhotoEditorViewController: CropViewControllerDelegate {
    
    public func cropViewController(_ controller: CropViewController, didFinishCroppingImage image: UIImage, transform: CGAffineTransform, cropRect: CGRect) {
        controller.dismiss(animated: true, completion: nil)
        clearButton.isHidden = false
        cropButton.isHidden = false
        drawButton.isHidden = false
        saveButton.isHidden = false
        shareButton.isHidden = false
        stickerButton.isHidden = false
        textButton.isHidden = false
        continueButton.isHidden = false
        self.setImageView(image: image)
    }
    
    public func cropViewControllerDidCancel(_ controller: CropViewController) {
        clearButton.isHidden = false
        cropButton.isHidden = false
        drawButton.isHidden = false
        saveButton.isHidden = false
        shareButton.isHidden = false
        stickerButton.isHidden = false
        textButton.isHidden = false
        continueButton.isHidden = false
        controller.dismiss(animated: true, completion: nil)
    }
    
}
