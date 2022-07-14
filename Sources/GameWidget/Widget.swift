//
//  Widget.swift
//  GameWidget
//
//  Created by rrbox on 2022/03/10.
//


import SpriteKit
import GameplayKit


public protocol Widget {
    func node() -> SKNode
}

@resultBuilder public struct UIFunction {
    public static func buildBlock<Part: Widget>(_ components: Part...) -> [Part] {
        components
    }
}

public struct RecursiveGroup<T: Widget, U: Widget>: Widget {
    
    var group: T
    var widgets: [U]
    
    public func place<V: Widget>(@UIFunction block: () -> [V]) -> RecursiveGroup<RecursiveGroup<T, U>, V> {
        return .init(group: .init(group: self.group, widgets: self.widgets), widgets: block())
    }
    
    public func node() -> SKNode {
        let result = SKNode()
        result.addChild(self.group.node())
        for i in self.widgets {
            result.addChild(i.node())
        }
        return result
    }
    
}

public struct SingleLayerDisplay<T: Widget>: Widget {
    
    var widgets: [T]
    
    public func place<U: Widget>(@UIFunction block: () -> [U]) -> RecursiveGroup<SingleLayerDisplay<T>, U> {
        return .init(group: .init(widgets: self.widgets), widgets: block())
    }
    
    public func node() -> SKNode {
        let result = SKNode()
        for i in self.widgets {
            result.addChild(i.node())
        }
        return result
    }
    
}
public struct Display: Widget {
    
    public func node() -> SKNode {
        #if DEBUG
        fatalError("[GameWidget error] Display not contain widget.")
        #else
        fatalError()
        #endif
    }
    
    public init() {}
    
    public func place<T: Widget>(@UIFunction block: () -> [T]) -> SingleLayerDisplay<T> {
        .init(widgets: block())
    }
    
}
