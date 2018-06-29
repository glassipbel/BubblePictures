//
//  BPDelegate.swift
//  Pods
//
//  Created by Kevin Belter on 1/2/17.
//
//

import Foundation

public protocol BPDelegate: class {
    func didSelectBubble(at index: Int)
    func didSelectTruncatedBubble()
}
