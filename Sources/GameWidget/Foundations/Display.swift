//
//  File.swift
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
    
    public func widgetNodes() -> [SKNode] {
        self.first.widgetNodes() + self.second.widgetNodes()
    }
    
    public func node() -> SKNode {
        let result = SKNode()
        
        for node in self.first.widgetNodes() + self.second.widgetNodes() {
            result.addChild(node)
        }
        
        return result
    }
    
}

/// 一つの widget から RecursiveDisplay を生成するためのラッパー.
/// Display の place により生成され, 一つの WidgetList を保持します.
public struct SingleWidgetDisplay<T: WidgetList>: Widget, WidgetList {
    var widgetList: T
    
    public func place<U: WidgetList>(@GroupBuilder block: () -> U) -> RecursiveDisplay<Self, U> {
        RecursiveDisplay(first: self, second: block())
    }
    
    public func widgetNodes() -> [SKNode] {
        self.widgetList.widgetNodes()
    }
    
    public func node() -> SKNode {
        let result = SKNode()
        for node in self.widgetList.widgetNodes() {
            result.addChild(node)
        }
        return result
    }
    
}

/// Widget のレイアウトの起点. place メソッドチェーンで無制限に Widget を配置できます.
/// - note: 一回の place メソッドで配置可能な widget の数は 10 個までです.
public struct Display: Widget {
    public init() {}
    
    public func place<T: WidgetList>(@GroupBuilder block: () -> T) -> SingleWidgetDisplay<T> {
        SingleWidgetDisplay(widgetList: block())
    }
    
    public func node() -> SKNode {
        fatalError("display has no widget")
    }
    
}

