//
//  ViewController.swift
//  BubblePictures
//
//  Created by Kevin Belter on 01/02/2017.
//  Copyright (c) 2017 Kevin Belter. All rights reserved.
//

import UIKit
import BubblePictures

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let configFiles = getConfigFiles()
        let layoutConfigurator = BPLayoutConfigurator(
            backgroundColorForTruncatedBubble: UIColor.gray,
            fontForBubbleTitles: UIFont(name: "HelveticaNeue-Light", size: 16.0)!,
            colorForBubbleBorders: UIColor.white,
            colorForBubbleTitles: UIColor.white,
            maxCharactersForBubbleTitles: 2,
            maxNumberOfBubbles: 6,
            numberForTruncatedCell: 25)
        
        bubblePictures = BubblePictures(collectionView: collectionView, configFiles: configFiles, layoutConfigurator: layoutConfigurator)
        bubblePictures.delegate = self
    }
    
    private var bubblePictures: BubblePictures!
    
    func getConfigFiles() -> [BPCellConfigFile] {
        return [
            BPCellConfigFile(
                imageType: BPImageType.URL(URL(string: "https://scontent.xx.fbcdn.net/v/t1.0-9/1069929_10200705658781699_1722535463_n.jpg?oh=91653a35620fd278ce2b7a7d026cdf2e&oe=5921B22D")!),
                title: "Lorena"),
            BPCellConfigFile(
                imageType: BPImageType.URL(URL(string: "https://scontent.xx.fbcdn.net/v/t1.0-9/1069929_10200705658781699_1722535463_n.jpg?oh=91653a35620fd278ce2b7a7d026cdf2e&oe=5921B22D")!),
                title: "Lorena Rodriguez"),
            BPCellConfigFile(
                imageType: BPImageType.URL(URL(string: "https://scontent.xx.fbcdn.net/v/t1.0-9/1069929_10200705658781699_1722535463_n.jpg?oh=91653a35620fd278ce2b7a7d026cdf2e&oe=5921B22D")!),
                title: ""),
            BPCellConfigFile(
                imageType: BPImageType.URL(URL(string: "https://scontent.xx.fbcdn.net/v/t1.0-9/1069929_10200705658781699_1722535463_n.jpg?oh=91653a35620fd278ce2b7a7d026cdf2e&oe=5921B22D")!),
                title: "Jaime Lanisky Patricio"),
            BPCellConfigFile(
                imageType: BPImageType.URL(URL(string: "https://scontent.xx.fbcdn.net/v/t1.0-9/1069929_10200705658781699_1722535463_n.jpg?oh=91653a35620fd278ce2b7a7d026cdf2e&oe=5921B22D")!),
                title: "Pocho Copernico zapallo colorin"),
            BPCellConfigFile(
                imageType: BPImageType.URL(URL(string: "https://scontent.xx.fbcdn.net/v/t1.0-9/37014_10200158828031272_645606694_n.jpg?oh=02cbae2f13b2ebbc946f1491af3cb19f&oe=58EC90AA")!),
                title: "K"),
            BPCellConfigFile(
                imageType: BPImageType.URL(URL(string: "https://scontent.xx.fbcdn.net/v/t1.0-9/543912_4371679407996_469579135_n.jpg?oh=45a71d035369a6d6475d58558da8eeac&oe=58E3580A")!),
                title: "FF"),
            BPCellConfigFile(
                imageType: BPImageType.URL(URL(string: "https://scontent.xx.fbcdn.net/v/t1.0-9/401067_2610613262443_2080303829_n.jpg?oh=c89c9b546c46bed20f348047beabd919&oe=591EB661")!),
                title: "CR"),
            BPCellConfigFile(
                imageType: BPImageType.URL(URL(string: "https://scontent.xx.fbcdn.net/v/t1.0-9/311478_2385117745196_542554972_n.jpg?oh=01ab9a02a6a32cd9806a287bf9403de5&oe=58F016E5")!),
                title: "KB"),
            BPCellConfigFile(
                imageType: BPImageType.URL(URL(string: "https://scontent.xx.fbcdn.net/v/t1.0-9/1069929_10200705658781699_1722535463_n.jpg?oh=91653a35620fd278ce2b7a7d026cdf2e&oe=5921B22D")!),
                title: "KO"),
            BPCellConfigFile(
                imageType: BPImageType.URL(URL(string: "https://scontent.xx.fbcdn.net/v/t1.0-9/37014_10200158828031272_645606694_n.jpg?oh=02cbae2f13b2ebbc946f1491af3cb19f&oe=58EC90AA")!),
                title: "PL"),
            BPCellConfigFile(
                imageType: BPImageType.URL(URL(string: "https://scontent.xx.fbcdn.net/v/t1.0-9/543912_4371679407996_469579135_n.jpg?oh=45a71d035369a6d6475d58558da8eeac&oe=58E3580A")!),
                title: "FF"),
            BPCellConfigFile(
                imageType: BPImageType.URL(URL(string: "https://scontent.xx.fbcdn.net/v/t1.0-9/401067_2610613262443_2080303829_n.jpg?oh=c89c9b546c46bed20f348047beabd919&oe=591EB661")!),
                title: "CR"),
            BPCellConfigFile(
                imageType: BPImageType.URL(URL(string: "https://scontent.xx.fbcdn.net/v/t1.0-9/311478_2385117745196_542554972_n.jpg?oh=01ab9a02a6a32cd9806a287bf9403de5&oe=58F016E5")!),
                title: "KB")
        ]
    }
}

extension ViewController: BPDelegate {
    func didSelectTruncatedBubble() {
        print("Selected truncated bubble")
    }
    
    func didSelectBubble(at index: Int) {
        print(index)
    }
}

