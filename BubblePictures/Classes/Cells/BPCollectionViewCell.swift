//
//  BPCollectionViewCell.swift
//  Pods
//
//  Created by Kevin Belter on 1/2/17.
//
//

import UIKit

class BPCollectionViewCell: UICollectionViewCell {
    
    class var className: String { return "BPCollectionViewCell" }
    
    @IBOutlet weak var viewWhiteBorders: UIView!
    @IBOutlet weak var imgBackground: UIImageView!
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var lblName: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        
        viewWhiteBorders.layer.masksToBounds = true
        viewWhiteBorders.layer.cornerRadius = viewWhiteBorders.bounds.height / 2.0
        viewWhiteBorders.layer.borderWidth = 4.0
        
        imgBackground.layer.masksToBounds = true
        imgBackground.layer.cornerRadius = imgBackground.bounds.height / 2.0
        imgBackground.layer.borderWidth = 4.0
        
        viewBackground.layer.masksToBounds = true
        viewBackground.layer.cornerRadius = viewBackground.bounds.height / 2.0
    }
    
    func configure(configFile: BPCellConfigFile) {
        self.backgroundColor = UIColor.clear
        
        viewBackground.isHidden = false
        
        switch configFile.imageType {
            case .image(let image):
                self.imgBackground.image = image
            case .URL(let url):
                self.imgBackground.setImageWithURLAnimated(url)
            case .color(let color):
                self.imgBackground.image = UIImage(color: color)
                self.viewBackground.isHidden = true
        }
        self.lblName.text = configFile.title
    }
    
    func configureLayout(layoutConfigurator: BPLayoutConfigurator) {
        viewWhiteBorders.layer.borderColor = layoutConfigurator.colorForBubbleBorders.cgColor
        imgBackground.layer.borderColor = layoutConfigurator.colorForBubbleBorders.cgColor
        lblName.font = layoutConfigurator.fontForBubbleTitles
        lblName.textColor = layoutConfigurator.colorForBubbleTitles
    }
}
