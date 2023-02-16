//
//  Widget.swift
//  GameWidget
//
//  Created by rrbox on 2022/03/10.
//

import SpriteKit

public protocol ContextPresentPlugIn {
    associatedtype Context: WidgetContextType
    associatedtype Node: SKNode
    func node(context: Context) -> Node
}

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

public extension NodeGenerator where Self: ContextPresentPlugIn, Context: ParameterLessGeneratable {
    func node() -> Node {
        self.node(context: Context())
    }
}
