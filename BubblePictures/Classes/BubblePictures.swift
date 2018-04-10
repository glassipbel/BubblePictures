//
//  BubblePicturesController.swift
//  Pods
//
//  Created by Kevin Belter on 1/2/17.
//
//

import UIKit

public class BubblePictures: NSObject {
    
    public init(collectionView: UICollectionView, configFiles: [BPCellConfigFile], layoutConfigurator: BPLayoutConfigurator = BPLayoutConfigurator()) {
        self.configFiles = configFiles
        self.collectionView = collectionView
        self.layoutConfigurator = layoutConfigurator
        self.collectionView.dataSource = nil
        self.collectionView.delegate = nil
        super.init()
        registerForNotifications()
        registerCells()
        setCollectionViewAlignment()
        truncateCells(configFiles: configFiles)
        assignAlignment()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    public var delegate: BPDelegate?
    
    @objc internal func rotated() {
        self.collectionView.delegate = nil
        self.collectionView.dataSource = nil
        
        self.truncateCells(configFiles: configFiles)
        self.assignAlignment()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.reloadData()
    }
    
    private func setCollectionViewAlignment() {
        if layoutConfigurator.direction == .rightToLeft {
            collectionView.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        } else {
            collectionView.transform = .identity
        }
    }
    
    private func registerForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
    }
    
    private func registerCells() {
        let nib = UINib(nibName: BPCollectionViewCell.className, bundle: BubblePictures.bubblePicturesBundle)
        self.collectionView.register(nib, forCellWithReuseIdentifier: BPCollectionViewCell.className)
    }
    
    private func truncateCells(configFiles: [BPCellConfigFile]) {
        self.configFilesTruncated = []
        if configFiles.count < maxNumberOfBubbles {
            configFilesTruncated = configFiles
            return
        }
        
        for (index, configFile) in configFiles.enumerated() {
            if index + 1 == maxNumberOfBubbles {
                let remainingCells = (configFiles.count + 1) - maxNumberOfBubbles
                let truncatedCell = BPCellConfigFile(
                    imageType: BPImageType.color(layoutConfigurator.backgroundColorForTruncatedBubble),
                    title: "+\(layoutConfigurator.numberForTruncatedCell ?? remainingCells)"
                )
                configFilesTruncated.append(truncatedCell)
                break
            }
            
            configFilesTruncated.append(configFile)
        }
    }
    
    private func assignAlignment() {
        let bubblesTotalWidth = (CGFloat(min(maxNumberOfBubbles, configFiles.count)) * (self.collectionView.bounds.height - negativeInsetWidth)) + negativeInsetWidth
        let emptyWidthSpace = self.collectionView.bounds.width - bubblesTotalWidth - 0.01
        let emptyWidthSpaceDivided = ((self.collectionView.bounds.width - bubblesTotalWidth) / 2.0) - 0.01
        if emptyWidthSpace < 0.0 { return }
        
        switch layoutConfigurator.alignment {
        case .center:
            self.collectionView.contentInset = UIEdgeInsets(top: 0.0, left: emptyWidthSpaceDivided, bottom: 0.0, right: emptyWidthSpaceDivided)
        case .left:
            switch layoutConfigurator.direction {
            case .leftToRight:
                self.collectionView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: emptyWidthSpace)
            case .rightToLeft:
                self.collectionView.contentInset = UIEdgeInsets(top: 0.0, left: emptyWidthSpace, bottom: 0.0, right: 0.0)
            }
        case .right:
            switch layoutConfigurator.direction {
            case .leftToRight:
                self.collectionView.contentInset = UIEdgeInsets(top: 0.0, left: emptyWidthSpace, bottom: 0.0, right: 0.0)
            case .rightToLeft:
                self.collectionView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: emptyWidthSpace)
            }
        }
    }
    
    fileprivate weak var collectionView: UICollectionView!
    fileprivate var configFiles: [BPCellConfigFile]
    fileprivate var configFilesTruncated: [BPCellConfigFile] = []
    fileprivate var layoutConfigurator: BPLayoutConfigurator
    fileprivate var negativeInsetWidth: CGFloat {
        return layoutConfigurator.distanceInterBubbles ?? (self.collectionView.bounds.height / 3.0)
    }
    fileprivate var maxNumberOfBubbles: Int {
        let calculationMaxNumberOfBubbles = Int(floor((self.collectionView.bounds.width - negativeInsetWidth) / (self.collectionView.bounds.height - negativeInsetWidth)))
        guard let maxNumberPreferredByUser = layoutConfigurator.maxNumberOfBubbles else {
            return calculationMaxNumberOfBubbles
        }
        return min(maxNumberPreferredByUser + 1, calculationMaxNumberOfBubbles)
    }
    internal class var bubblePicturesBundle: Bundle? {
        let podBundle = Bundle(for: self)
        guard
            let bundleURL = podBundle.url(forResource: "BubblePictures", withExtension: "bundle"),
            let bundle = Bundle(url: bundleURL)
            else { return nil }
        
        return bundle
    }
}

extension BubblePictures: UICollectionViewDataSource {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.configFilesTruncated.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BPCollectionViewCell.className, for: indexPath) as! BPCollectionViewCell

        let isTruncatedCell = indexPath.item == configFilesTruncated.count - 1 && configFiles.count > maxNumberOfBubbles - 1
        cell.configure(configFile: configFilesTruncated[indexPath.item], layoutConfigurator: layoutConfigurator, isTruncatedCell: isTruncatedCell)
        cell.layer.zPosition = CGFloat(indexPath.item)
        
        if layoutConfigurator.direction == .rightToLeft {
            cell.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        } else {
            cell.transform = .identity
        }
        return cell
    }
    
}

extension BubblePictures: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.height, height: collectionView.bounds.height)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return -negativeInsetWidth
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == configFilesTruncated.count - 1 && configFiles.count > maxNumberOfBubbles - 1 {
            delegate?.didSelectTruncatedBubble()
            return
        }
        delegate?.didSelectBubble(at: indexPath.item)
    }
}
