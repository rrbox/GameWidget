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
    func addTo(parent list: inout [SKNode])
}

public extension Widget {
    func addTo(parent list: inout [SKNode]) {
        list.append(self.node())
    }
}

public protocol MoveableItem: Widget {
    var position: CGPoint { get set }
}

public extension MoveableItem {
    func position(_ value: CGPoint) -> Self {
        var result = self
        result.position = value
        return result
    }
}

public protocol RotatableItem: Widget {
    var zRotation: CGFloat { get set }
}

public extension RotatableItem {
    
    func zRotation(_ value: CGFloat) -> Self {
        var result = self
        result.zRotation = value
        return result
    }
    
}

public protocol ScalableItem: Widget {
    var xScale: CGFloat { get set }
    var yScale: CGFloat { get set }
}

public extension ScalableItem {
    
    func scale(_ value: CGFloat) -> Self {
        var result = self
        result.xScale = value
        result.yScale = value
        return result
    }
    
    func xScale(_ value: CGFloat) -> Self {
        var result = self
        result.xScale = value
        return result
    }
    
    func yScale(_ value: CGFloat) -> Self {
        var result = self
        result.yScale = value
        return result
    }
    
}

public typealias NodeWidget = MoveableItem & RotatableItem & ScalableItem


@resultBuilder public struct UIFunction {
    public static func buildBlock<Part: Widget>(_ components: Part...) -> [Part] {
        components
    }
}

public protocol WidgetGroup: Widget {
    func widgetNodes() -> [SKNode]
}

public struct RecursiveGroup<T: WidgetGroup, U: Widget>: WidgetGroup {
    
    var group: T
    var widgets: [U]
    
    public func place<V: Widget>(@UIFunction block: () -> [V]) -> RecursiveGroup<RecursiveGroup<T, U>, V> {
        return .init(group: .init(group: self.group, widgets: self.widgets), widgets: block())
    }
    
    public func widgetNodes() -> [SKNode] {
        self.widgets.map { widget in
            widget.node()
        } + group.widgetNodes()
    }
    
    public func node() -> SKNode {
        let result = SKNode()
        for node in self.widgetNodes() {
            result.addChild(node)
        }
        return result
    }
    
}

public struct SingleWidgetGroup<T: Widget>: WidgetGroup {
    
    var widgets: [T]
    
    public func place<U: Widget>(@UIFunction block: () -> [U]) -> RecursiveGroup<SingleWidgetGroup<T>, U> {
        return .init(group: .init(widgets: self.widgets), widgets: block())
    }
    
    public func widgetNodes() -> [SKNode] {
        self.widgets.map { widget in
            widget.node()
        }
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
    
    public func place<T: Widget>(@UIFunction block: () -> [T]) -> SingleWidgetGroup<T> {
        .init(widgets: block())
    }
    
}
