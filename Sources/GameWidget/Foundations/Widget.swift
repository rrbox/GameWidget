//
//  Widget.swift
//  GameWidget
//
//  Created by rrbox on 2022/03/10.
//


import SpriteKit
import GameplayKit

public protocol Widget {
    func node(context: Context) -> SKNode
    func node() -> SKNode
    func addTo(parent list: inout [SKNode])
    
    associatedtype Context: ContextProtocol
}

public extension Widget {
    func addTo(parent list: inout [SKNode]) {
        list.append(self.node())
    }
}
