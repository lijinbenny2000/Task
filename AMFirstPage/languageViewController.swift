//
//  languageViewController.swift
//  AMFirstPage
//
//  Created by Lijin Benny on 30/10/23.
//

import Foundation
import UIKit
protocol LanguageSelectionDelegate: AnyObject {
    func didSelectlanguage(lang: String)
}

class languageViewController: UIViewController, CountrySelectionDelegate{
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    var delegate: LanguageSelectionDelegate?
    @IBOutlet weak var languageTableView: UITableView!
    var languages: [String] = ["English" , "Arabic"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        languageTableView.register(UINib(nibName: "languageCustomCell", bundle: nil), forCellReuseIdentifier: "languageCell")
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage.add, style: .plain, target: self, action: #selector(moreOptions))]
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.remove, style: .plain, target: self, action: #selector(dismissApp))
        
        // Do any additional setup after loading the view.
    }
    @IBAction func closeButtonTapped(_ sender: UIButton) {
            self.dismiss(animated: true, completion: nil)
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let navController = segue.destination as? UINavigationController ,
           let destination = navController.topViewController as? CountryViewController {
            destination.delegate = self
        }
    }
    
    @objc func moreOptions() {
        let alertController = UIAlertController(title: "Alert", message: "Press 'Dismiss' to exit the application.", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .destructive) { _ in
            exit(0)
        }
        alertController.addAction(dismissAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    @objc func dismissApp(){
        dismiss(animated: true, completion: nil)
    }
    func didSelectCountry(icon: String, title: String) {
        countryImage.image = UIImage(named: icon)
        countryName.text = title
    }
    
}

extension languageViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = languages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "languageCell", for: indexPath) as? languageCustomCell
        cell?.fillCustomlanguageCell(languageTitle: data, checklist: "checklist")
        return cell ?? UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedlanguage = languages[indexPath.row]
        delegate?.didSelectlanguage(lang: selectedlanguage)
        let cell = tableView.cellForRow(at: indexPath) as? languageCustomCell
            cell?.showSelectionIndicator()
            cell?.selectionStyle = .none
//        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        dismiss(animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        let cell = tableView.cellForRow(at: indexPath) as? languageCustomCell
            cell?.hideSelectionIndicator()
    }
}



