//
//  Widget.swift
//  GameWidget
//
//  Created by rrbox on 2022/03/10.
//

import SpriteKit

public protocol ContextPresenter {
    associatedtype Context: WidgetContextType
    associatedtype Node: SKNode
    func node(context: Context) -> Node
}

public protocol ParameterLessNodeGenerator {
    associatedtype Node: SKNode
    func node() -> Node
}

public protocol WidgetListElementType {
    func addTo(buffer: inout [SKNode])
}

public protocol Widget: ParameterLessNodeGenerator, WidgetListElementType {
    
}

public extension WidgetListElementType where Self: ParameterLessNodeGenerator {
    func addTo(buffer: inout [SKNode]) {
        buffer.append(self.node())
    }
}

public extension ParameterLessNodeGenerator where Self: ContextPresenter, Context: ParameterLessGeneratable {
    func node() -> Node {
        self.node(context: Context())
    }
}
