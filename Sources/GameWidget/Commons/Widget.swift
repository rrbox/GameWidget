//
//  Widget.swift
//  GameWidget
//
//  Created by rrbox on 2022/03/10.
//

import SpriteKit

public protocol ContextPresenter {
    associatedtype Context: WidgetContextType
    func node(context: Context) -> SKNode
}

public protocol ParameterLessNodeGenerator {
    func node() -> SKNode
}

public protocol WidgetListElementType {
    func addTo(parent list: inout [SKNode])
}

public protocol Widget: ContextPresenter, ParameterLessNodeGenerator, WidgetListElementType {
    
}

public extension WidgetListElementType where Self: ParameterLessNodeGenerator {
    func addTo(parent list: inout [SKNode]) {
        list.append(self.node())
    }
}

public extension ParameterLessNodeGenerator where Self: ContextPresenter, Context: ParameterLessGeneratable {
    func node() -> SKNode {
        self.node(context: Context())
    }
}
