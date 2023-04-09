//
//  Display.swift
//  
//
//  Created by rrbox on 2022/07/24.
//

import SpriteKit

/// Widget のレイアウトの起点. place メソッドチェーンで無制限に Widget を配置できます.
/// - note: 一回の place メソッドで配置可能な widget の数は 10 個までです.
public struct Display {
    public init() {}
    
    /// ``Display/Single`` の ``Display/Single/place(block:)`` により生成され, 二つの ``WidgetList`` を保持します.
    public struct Link<T: WidgetList, U: WidgetList> {
        let value: (T, U)
    }
    
    /// 一つの widget から ``Display/Link`` を生成するためのラッパー.
    /// ``Display`` の ``Display/place(block:)`` により生成され, 一つの ``WidgetList`` を保持します.
    public struct Single<T: WidgetList> {
        let value: T
    }
    
}

public extension Display {
    func place<T: WidgetList>(@GroupBuilder block: () -> T) -> Display.Single<T> {
        .init(value: block())
    }
}

extension Display.Link: Widget, WidgetList {
    public func place<V: WidgetList>(@GroupBuilder block: () -> V) -> Display.Link<Self, V> {
        .init(value: (self, block()))
    }
    
    public func widgetNodes(center: WidgetNotificationSystem) -> [SKNode] {
        self.value.0.widgetNodes(center: center) + self.value.1.widgetNodes(center: center)
    }
    
    public func node() -> SKNode {
        return SKNode()
    }
    
    public func combine(node: SKNode, center: WidgetNotificationSystem) {
        for i in self.value.0.widgetNodes(center: center) + self.value.1.widgetNodes(center: center) {
            node.addChild(i)
        }
    }
}

extension Display.Single: Widget, WidgetList {
    public func place<U: WidgetList>(@GroupBuilder block: () -> U) -> Display.Link<Self, U> {
        .init(value: (self, block()))
    }
    
    public func widgetNodes(center: WidgetNotificationSystem) -> [SKNode] {
        self.value.widgetNodes(center: center)
    }
    
    public func node() -> SKNode {
        return SKNode()
    }
    
    public func combine(node: SKNode, center: WidgetNotificationSystem) {
        for i in self.value.widgetNodes(center: center) {
            node.addChild(i)
        }
    }
}
