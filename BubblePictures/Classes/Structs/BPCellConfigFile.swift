//
//  BubblePictureCellConfigFile.swift
//  Pods
//
//  Created by Kevin Belter on 1/2/17.
//
//

import UIKit

public struct BPCellConfigFile {
    var imageType: BPImageType
    var title: String
    
    public init(imageType: BPImageType, title: String) {
        self.imageType = imageType
        self.title = title
    }
}
