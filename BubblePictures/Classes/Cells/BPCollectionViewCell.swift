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
    @IBOutlet weak var viewBackgroundWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var lblNameCenterXConstraint: NSLayoutConstraint!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        
        viewWhiteBorders.layer.masksToBounds = true
        viewWhiteBorders.layer.cornerRadius = viewWhiteBorders.bounds.height / 2.0
        
        imgBackground.layer.masksToBounds = true
        imgBackground.layer.cornerRadius = imgBackground.bounds.height / 2.0
        
        viewBackground.layer.masksToBounds = true
        viewBackground.layer.cornerRadius = viewBackground.bounds.height / 2.0
    }
    
    func configure(configFile: BPCellConfigFile, layoutConfigurator: BPLayoutConfigurator, isTruncatedCell: Bool) {
        self.backgroundColor = UIColor.clear
        
        viewBackground.isHidden = false
        
        configureImage(imageType: configFile.imageType, title: configFile.title, layoutConfigurator: layoutConfigurator)
        configureTitle(fullTitle: configFile.title, maxLenght: layoutConfigurator.maxCharactersForBubbleTitles, isTruncatedCell: isTruncatedCell)
        configureLayout(layoutConfigurator: layoutConfigurator)
        
        viewWhiteBorders.layer.borderWidth = layoutConfigurator.widthForBubbleBorders
        viewBackgroundWidthConstraint.constant = layoutConfigurator.widthForBubbleBorders * -2
        lblNameCenterXConstraint.constant = isTruncatedCell ? -2 : -4
    }
    
    private func configureImage(imageType: BPImageType, title: String, layoutConfigurator: BPLayoutConfigurator) {
        switch imageType {
        case .image(let image):
            self.imgBackground.image = image
            self.viewBackground.isHidden = title == ""
        case .URL(let url):
            self.imgBackground.setImageWithURLAnimated(url)
            self.viewBackground.isHidden = title == ""
        case .color(let color):
            self.imgBackground.image = UIImage(color: color)
            self.viewBackground.isHidden = true
        }
        imgBackground.contentMode = layoutConfigurator.bubbleImageContentMode
    }
    
    private func configureLayout(layoutConfigurator: BPLayoutConfigurator) {
        viewWhiteBorders.layer.borderColor = layoutConfigurator.colorForBubbleBorders.cgColor
        lblName.font = layoutConfigurator.fontForBubbleTitles
        lblName.textColor = layoutConfigurator.colorForBubbleTitles
    }
    
    private func configureTitle(fullTitle: String, maxLenght: Int, isTruncatedCell: Bool) {
        var name = ""
        defer { lblName.text = name }
        
        if isTruncatedCell {
            name = fullTitle
            return
        }
        
        let names = fullTitle.components(separatedBy: " ")
        
        if names.count == 1 {
            guard let uniqueName = names.first?.substring(to: maxLenght) else { return }
            name = uniqueName
            return
        }
        
        for (index, truncatedName) in names.enumerated() {
            if index == maxLenght { return }
            
            name = "\(name + truncatedName.substring(to: 1))"
        }
    }
}
