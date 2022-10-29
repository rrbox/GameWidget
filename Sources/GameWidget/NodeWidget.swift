//
//  NodeWidget.swift
//  
//
//  Created by rrbox on 2022/10/29.
//

import SpriteKit

/// 10 個以下の widget を一つの widget としてまとめます. 座標, スケール, 回転を内包するコンテンツと共に調整することができます.
/// - note: 数値をもつため, 40バイトのメモリを必要とします.
public struct Node<Content: WidgetList>: NodeWidget, WidgetList {
    public typealias Context = Never
    
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
    
    public func node(context: Never) -> SKNode {
        
    }
    
    public func node() -> SKNode {
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
