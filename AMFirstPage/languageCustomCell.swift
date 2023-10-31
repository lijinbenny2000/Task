//
//  languageCustomeCell.swift
//  AMFirstPage
//
//  Created by Lijin Benny on 30/10/23.
//

import Foundation
import UIKit
class languageCustomCell : UITableViewCell {
    var arrayobj: languageViewController?
    @IBOutlet weak var customlanguage: UILabel!
    @IBOutlet weak var checkListImage: UIImageView!
    
    
    
    
    
    
    
    func fillCustomlanguageCell(languageTitle: String , checklist: String) {
        self.customlanguage.text = languageTitle
        
        self.checkListImage.image = UIImage(named:checklist)
        
    }
    override func awakeFromNib() {
           super.awakeFromNib()
           checkListImage.isHidden = true
       }
    func showSelectionIndicator() {
            checkListImage.isHidden = false
        }
    func hideSelectionIndicator() {
            checkListImage.isHidden = true
        }
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 22
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        let viewFrame = contentView.frame
        let cellFrame = viewFrame.inset(by: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
        contentView.frame = cellFrame
        
    }
    
}
