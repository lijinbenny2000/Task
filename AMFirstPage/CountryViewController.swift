//
//  CountryViewController.swift
//  AMFirstPage
//
//  Created by Lijin Benny on 26/10/23.
//

import Foundation
import UIKit
protocol CountrySelectionDelegate: AnyObject {
    func didSelectCountry(icon: String, title: String)
}

class CountryViewController: UIViewController {
    var delegate: CountrySelectionDelegate?
    @IBOutlet weak var countryTableView: UITableView!
   
    
    var countries:[(icon: String, title: String)] = [("jordan","Jordan"),
                                                     ("palestine","Palestine"),
                                                     ("egypt","Egypt"),
                                                     ("lebanon","Lebanon"),
                                                     ("united-arab-emirates","United Arab Emirates"),
                                                     ("qatar","Qatar"),
                                                     ("bahrain","Bahrain"),
                                                     ("algeria","Algeria")]
    override func viewDidLoad() {
        super.viewDidLoad()
        countryTableView.register(UINib(nibName: "countryCustomCell", bundle: nil), forCellReuseIdentifier: "countryCellIdentifier")
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage.add, style: .plain, target: self, action: #selector(moreOptions))]
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.remove, style: .plain, target: self, action: #selector(dismissApp))
       
        // Do any additional setup after loading the view.
    }
    @IBAction func closeButtonTapped(_ sender: UIButton) {
            self.dismiss(animated: true, completion: nil)
        }
    
    @objc func moreOptions() {
        let alertController = UIAlertController(title: "Alert", message: "Press 'Dismiss' to exit.", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .destructive) { _ in
            exit(0)
        }
        alertController.addAction(dismissAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    @objc func dismissApp(){
        dismiss(animated: true, completion: nil)
    }
    
}

extension CountryViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = countries[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCellIdentifier", for: indexPath) as? countryCustomCell
        cell?.fillCustomCell(imageIcon: data.icon, imageTitle: data.title, checklist: "checklist")
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountry = countries[indexPath.row]
        delegate?.didSelectCountry(icon: selectedCountry.icon, title: selectedCountry.title)
        let cell = tableView.cellForRow(at: indexPath) as? countryCustomCell
            cell?.showSelectionIndicator()
            cell?.selectionStyle = .none
//        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        let cell = tableView.cellForRow(at: indexPath) as? countryCustomCell
            cell?.hideSelectionIndicator()
    }
}


