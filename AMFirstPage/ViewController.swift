//
//  ViewController.swift
//  AMFirstPage
//
//  Created by Lijin Benny on 26/10/23.
//

import UIKit

class ViewController: UIViewController ,CountrySelectionDelegate ,LanguageSelectionDelegate {
   
    
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var testUserButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
//        testUserButton.setTitle(NSLocalizedString("testUserButton", comment: ""), for: .normal)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Chalkboard SE", size: 13) ?? UIFont.systemFont(ofSize: 13)
        ]
        testUserButton.setAttributedTitle(NSAttributedString(string: NSLocalizedString("testUserButton", comment: ""), attributes: attributes), for: .normal)

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let navController = segue.destination as? UINavigationController ,
            let destination = navController.topViewController as? CountryViewController {
                destination.delegate = self
            }
        if let navController2 = segue.destination as? UINavigationController ,
            let destination2 = navController2.topViewController as? languageViewController {
                destination2.delegate = self
            }
        }
    func didSelectCountry(icon: String, title: String) {
        countryImage.image = UIImage(named: icon)
        countryName.text = title
        
    }
    func didSelectlanguage(lang: String) {
        languageLabel.text = lang
    }
}

