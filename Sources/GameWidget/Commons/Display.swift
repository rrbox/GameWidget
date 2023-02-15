//
//  Display.swift
//  
//
//  Created by rrbox on 2022/07/24.
//

import SpriteKit

/// SingleWidgetDisplay の place により生成され, 二つの WidgetList(一方は Display)を保持します.
public struct RecursiveDisplay<T: WidgetList, U: WidgetList>: Widget, WidgetList {
    
    var first: T
    var second: U
    
    public func place<V: WidgetList>(@GroupBuilder block: () -> V) -> RecursiveDisplay<Self, V> {
        .init(first: self, second: block())
    }
    
    public func widgetNodes(center: NotificationCenter) -> [SKNode] {
        self.first.widgetNodes(center: center) + self.second.widgetNodes(center: center)
    }
    
    public func node() -> SKNode {
        SKNode()
    }
    
    public func combine(node: SKNode, center: NotificationCenter) {
        for n in self.first.widgetNodes(center: center) + self.second.widgetNodes(center: center) {
            node.addChild(n)
        }
    }
}

/// 一つの widget から RecursiveDisplay を生成するためのラッパー.
/// Display の place により生成され, 一つの WidgetList を保持します.
public struct SingleWidgetDisplay<T: WidgetList>: Widget, WidgetList {
    
    var widgetList: T
    
    public func place<U: WidgetList>(@GroupBuilder block: () -> U) -> RecursiveDisplay<Self, U> {
        RecursiveDisplay(first: self, second: block())
    }
    
    public func widgetNodes(center: NotificationCenter) -> [SKNode] {
        self.widgetList.widgetNodes(center: center)
    }
    
    public func node() -> SKNode {
        let result = SKNode()
       
        return result
    }
    
    public func combine(node: SKNode, center: NotificationCenter) {
        for n in self.widgetList.widgetNodes(center: center) {
            node.addChild(n)
        }
    }
    
}

/// Widget のレイアウトの起点. place メソッドチェーンで無制限に Widget を配置できます.
/// - note: 一回の place メソッドで配置可能な widget の数は 10 個までです.
public struct Display {
    public init() {}
    
    public func place<T: WidgetList>(@GroupBuilder block: () -> T) -> SingleWidgetDisplay<T> {
        SingleWidgetDisplay(widgetList: block())
    }
    
}

