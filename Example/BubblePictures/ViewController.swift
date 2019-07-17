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
            maxNumberOfBubbles: 2,
            displayForTruncatedCell: BPTruncatedCellDisplay.number(4),
            direction: .leftToRight,
            alignment: .center)
        
        bubblePictures = BubblePictures(collectionView: collectionView, configFiles: configFiles, layoutConfigurator: layoutConfigurator)
        bubblePictures.delegate = self
    }
    
    private var bubblePictures: BubblePictures!
    
    func getConfigFiles() -> [BPCellConfigFile] {
        return [
            BPCellConfigFile(
                imageType: BPImageType.URL(URL(string: "https://scontent.fmex11-1.fna.fbcdn.net/v/t1.0-9/45612407_10156745746132298_5242888542689951744_o.jpg?_nc_cat=101&_nc_oc=AQm-E54qORJy0Xf3GhyoGzIF1xYOojBjVfUBuzPtPssMK8jCb-4spXX8AwlVbae8x3k&_nc_ht=scontent.fmex11-1.fna&oh=1eb01390cc51e219d8909bc9bd24ef06&oe=5DB522FE")!),
                title: "Kevin"),
            BPCellConfigFile(
                imageType: BPImageType.URL(URL(string: "https://scontent.fmex11-1.fna.fbcdn.net/v/t1.0-9/49948874_10215720889673087_1665928036417011712_n.jpg?_nc_cat=107&_nc_oc=AQlR2g4PSo-ILw-YWI7edjzIMvkIPnTKqeEZuVEmsCG2xz2D8h6Xo6oGycx0QfrErYc&_nc_ht=scontent.fmex11-1.fna&oh=be34a1caef7d1e9dcdab5d46997788dd&oe=5DAE4C28")!),
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
