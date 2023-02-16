//
//  Widget.swift
//  GameWidget
//
//  Created by rrbox on 2022/03/10.
//

import SpriteKit

public protocol NodeGenerator {
    associatedtype Node: SKNode
    func node() -> Node
}

public protocol WidgetListElementType {
    func addTo(buffer: inout [SKNode])
}

public protocol Widget: NodeGenerator, WidgetListElementType {
    
}

public extension WidgetListElementType where Self: NodeGenerator {
    func addTo(buffer: inout [SKNode]) {
        buffer.append(self.node())
    }
}