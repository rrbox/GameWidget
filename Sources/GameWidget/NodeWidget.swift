//
//  NodeWidget.swift
//  
//
//  Created by rrbox on 2022/10/29.
//

import SpriteKit

public struct NodeContext: ContextProtocol {
    public init() {
        
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

/// 10 個以下の widget を一つの widget としてまとめます. 座標, スケール, 回転を内包するコンテンツと共に調整することができます.
/// - note: 数値をもつため, 40バイトのメモリを必要とします.
public struct Node<Content: WidgetList>: NodeWidget, WidgetList {
    public typealias Context = NodeContext
    
    public var position: CGPoint = .zero
    public var zRotation: CGFloat = .zero
    public var xScale: CGFloat = 1
    public var yScale: CGFloat = 1
    
    var content: Content
    
    public init(@GroupBuilder _ content: () -> Content) {
        self.content = content()
    }
    
    public func widgetNodes() -> [SKNode] {
        var result = [SKNode]()
        self.addTo(parent: &result)
        return result
    }
    
    public func node(context: NodeContext) -> SKNode {
        let result = SKNode()
        
        result.position = self.position
        result.zRotation = self.zRotation
        result.xScale = self.xScale
        result.yScale = self.yScale
        
        for i in self.content.widgetNodes() {
            result.addChild(i)
        }
        return result
    }
    
}
