//
//  Widget.swift
//  GameWidget
//
//  Created by rrbox on 2022/03/10.
//

import SpriteKit

// widget definitions

/// `node()` で SKNode サブクラスを生成する protocol です.
public protocol NodeGenerator {
    associatedtype Node: SKNode
    func node() -> Node
    func combine(node: Node, center: NotificationCenter)
}

public protocol WidgetListElementType {
//    func addTo(buffer: inout [SKNode])
    func addTo(buffer: inout [SKNode], center: NotificationCenter)
}

/// Widget を定義するための最低限の機能を提供する protocol です.
public protocol Widget: NodeGenerator, WidgetListElementType {
    
}




