//
//  NodeWidget.swift
//  
//
//  Created by rrbox on 2022/10/29.
//

import SpriteKit

public protocol PositionContextProtocol: ContextProtocol {
    var position: CGPoint { get set }
    
}

public struct Position<Context: PositionContextProtocol>: Modifier {
    var value: CGPoint
    
    public init(value: CGPoint) {
        self.value = value
    }
    
    public func mod(context: inout Context) {
        context.position = self.value
    }
    
}

public protocol RotatableContextProtocol: ContextProtocol {
    var zRotation: CGFloat { get set }
    
}

public struct ZRotation<Context: RotatableContextProtocol>: Modifier {
    var value: CGFloat
    
    public init(value: CGFloat) {
        self.value = value
    }
    
    public func mod(context: inout Context) {
        context.zRotation = self.value
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

public struct NodeContext: PositionContextProtocol, RotatableContextProtocol {
    public var position: CGPoint = .zero
    public var zRotation: CGFloat = .zero
    
    public init() {
        
    }
}

public typealias NodeWidget = ScalableItem

/// 10 個以下の widget を一つの widget としてまとめます. 座標, スケール, 回転を内包するコンテンツと共に調整することができます.
/// - note: 数値をもつため, 40バイトのメモリを必要とします.
public struct Node<Content: WidgetList>: NodeWidget, WidgetList {
    public typealias Context = NodeContext
    
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
        
        result.position = context.position
        result.zRotation = context.zRotation
        result.xScale = self.xScale
        result.yScale = self.yScale
        
        for i in self.content.widgetNodes() {
            result.addChild(i)
        }
        return result
    }
    
}
