//
//  ViewController.swift
//  landmarkBook
//
//  Created by Sercan Yeşilyurt on 22.02.2025.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var landmarkNames: [String] = ["Ağrı", "Diyarbakır", "Erzurum", "Van"]
    var landmarkImages: [UIImage] = [
        UIImage(named: "agri") ?? UIImage(),
        UIImage(named: "diyarbakir") ?? UIImage(),
        UIImage(named: "erzurum") ?? UIImage(),
        UIImage(named: "van") ?? UIImage()
    ]
    var chosenLandmark: String = ""
    var chosenImage : UIImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmark = landmarkNames[indexPath.row]
        chosenImage = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailVC", sender: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            if let destinationVC = segue.destination as? DetailsVC {
                destinationVC.selectedLandmark = chosenLandmark
                destinationVC.selectedUIImage = chosenImage
            }
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

