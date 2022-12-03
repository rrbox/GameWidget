//
//  Widget.swift
//  GameWidget
//
//  Created by rrbox on 2022/03/10.
//


import SpriteKit
import GameplayKit

public protocol ContextNodeGenerator {
    associatedtype Context: ContextProtocol
    func node(context: Context) -> SKNode
}

public protocol VoidNodeGenerator {
    func node() -> SKNode
}

public protocol WidgetListElementType {
    func addTo(parent list: inout [SKNode])
}

public protocol Widget: ContextNodeGenerator, VoidNodeGenerator, WidgetListElementType {
    
}


public extension WidgetListElementType where Self: VoidNodeGenerator {
    func addTo(parent list: inout [SKNode]) {
        list.append(self.node())
    }
}

public extension VoidNodeGenerator where Self: ContextNodeGenerator {
    func node() -> SKNode {
        self.node(context: Context())
    }
}
