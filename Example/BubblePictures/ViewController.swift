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
            maxNumberOfBubbles: 3,
            direction: .right,
            centered: true)
        
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
                imageType: BPImageType.URL(URL(string: "https://scontent.xx.fbcdn.net/v/t1.0-9/1069929_10200705658781699_1722535463_n.jpg?oh=91653a35620fd278ce2b7a7d026cdf2e&oe=5921B22D")!),
                title: "Pocho Copernico zapallo colorin"),
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
                imageType: BPImageType.URL(URL(string: "https://scontent.xx.fbcdn.net/v/t1.0-9/1069929_10200705658781699_1722535463_n.jpg?oh=91653a35620fd278ce2b7a7d026cdf2e&oe=5921B22D")!),
                title: "Pocho Copernico zapallo colorin")
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
