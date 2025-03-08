//
//  DetailsVC.swift
//  landmarkBook
//
//  Created by Sercan Yeşilyurt on 9.03.2025.
//

import UIKit

class DetailsVC: UIViewController {
    
    @IBOutlet weak var landmarkLabel: UILabel!
    @IBOutlet weak var landmarkImage: UIImageView!
    
    var selectedLandmark = ""
    var selectedUIImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        landmarkImage.image = selectedUIImage
        landmarkLabel.text = selectedLandmark
    }

}
