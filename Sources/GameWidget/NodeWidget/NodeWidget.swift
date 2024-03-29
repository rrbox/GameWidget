//
//  NodeWidget.swift
//  
//
//  Created by rrbox on 2022/10/29.
//

import SpriteKit

/// 10 個以下の widget を一つの widget としてまとめます. 座標, スケール, 回転を内包するコンテンツと共に調整することができます.
/// - note: 数値をもつため, 40バイトのメモリを必要とします.
public struct Node<Content: WidgetList>: Widget, WidgetList {
    public typealias Context = NodeContext
    public
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
        result.xScale = context.xScale
        result.yScale = context.yScale
        result.zPosition = context.zPosition
        
        for i in self.content.widgetNodes() {
            result.addChild(i)
        }
        return result
    }
    
}
