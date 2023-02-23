//
//  Display.swift
//  
//
//  Created by rrbox on 2022/07/24.
//

import SpriteKit

/// SingleWidgetDisplay の place により生成され, 二つの WidgetList(一方は Display)を保持します.
public struct RecursiveDisplay<T: WidgetList, U: WidgetList>: Widget, WidgetList {
    
    let value: (T, U)
    
    public func place<V: WidgetList>(@GroupBuilder block: () -> V) -> RecursiveDisplay<Self, V> {
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

/// 一つの widget から RecursiveDisplay を生成するためのラッパー.
/// Display の place により生成され, 一つの WidgetList を保持します.
public struct SingleWidgetDisplay<T: WidgetList>: Widget, WidgetList {
    
    let value: T
    
    public func place<U: WidgetList>(@GroupBuilder block: () -> U) -> RecursiveDisplay<Self, U> {
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

/// Widget のレイアウトの起点. place メソッドチェーンで無制限に Widget を配置できます.
/// - note: 一回の place メソッドで配置可能な widget の数は 10 個までです.
public struct Display {
    public init() {}
    
    public func place<T: WidgetList>(@GroupBuilder block: () -> T) -> SingleWidgetDisplay<T> {
        SingleWidgetDisplay(value: block())
    }
    
}

