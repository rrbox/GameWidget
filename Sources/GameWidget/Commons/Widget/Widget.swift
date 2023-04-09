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
    func combine(node: Node, center: WidgetNotificationSystem)
}

public protocol WidgetListElementType {
    func addTo(buffer: inout [SKNode], center: WidgetNotificationSystem)
}

public protocol Widget: NodeGenerator, WidgetListElementType {
    
}
