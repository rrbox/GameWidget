//
//  ObserveableNode.swift
//  
//
//  Created by rrbox on 2023/02/17.
//

import SpriteKit

public protocol ObserveableNode: SKNode {
    associatedtype Identifier
    func registerTo(center: NotificationCenter, id: Identifier)
}
