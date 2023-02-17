//
//  Group.swift
//  
//
//  Created by rrbox on 2022/07/24.
//

import CoreGraphics
import SpriteKit

@resultBuilder public struct GroupBuilder {
    
    public static func buildBlock<C0: WidgetListElementType>(_ c0: C0) -> some WidgetList {
        Single(widget: c0)
    }
    
    public static func buildBlock<C0: WidgetListElementType,
                                  C1: WidgetListElementType>(_ c0: C0, _ c1: C1) -> some WidgetList {
        Single(widget: c0)
            .append(c1)
    }
    
    public static func buildBlock<C0: WidgetListElementType,
                                  C1: WidgetListElementType,
                                  C2: WidgetListElementType>(_ c0: C0, _ c1: C1, _ c2: C2) -> some WidgetList {
        Single(widget: c0)
            .append(c1)
            .append(c2)
    }
    
    public static func buildBlock<C0: WidgetListElementType,
                                  C1: WidgetListElementType,
                                  C2: WidgetListElementType,
                                  C3: WidgetListElementType>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> some WidgetList {
        Single(widget: c0)
            .append(c1)
            .append(c2)
            .append(c3)
    }
    
    public static func buildBlock<C0: WidgetListElementType,
                                  C1: WidgetListElementType,
                                  C2: WidgetListElementType,
                                  C3: WidgetListElementType,
                                  C4: WidgetListElementType>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> some WidgetList {
        Single(widget: c0)
            .append(c1)
            .append(c2)
            .append(c3)
            .append(c4)
    }
    
    public static func buildBlock<C0: WidgetListElementType,
                                  C1: WidgetListElementType,
                                  C2: WidgetListElementType,
                                  C3: WidgetListElementType,
                                  C4: WidgetListElementType,
                                  C5: WidgetListElementType>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> some WidgetList {
        Single(widget: c0)
            .append(c1)
            .append(c2)
            .append(c3)
            .append(c4)
            .append(c5)
    }
    
    public static func buildBlock<C0: WidgetListElementType,
                                  C1: WidgetListElementType,
                                  C2: WidgetListElementType,
                                  C3: WidgetListElementType,
                                  C4: WidgetListElementType,
                                  C5: WidgetListElementType,
                                  C6: WidgetListElementType>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> some WidgetList {
        Single(widget: c0)
            .append(c1)
            .append(c2)
            .append(c3)
            .append(c4)
            .append(c5)
            .append(c6)
    }
    
    public static func buildBlock<C0: WidgetListElementType,
                                  C1: WidgetListElementType,
                                  C2: WidgetListElementType,
                                  C3: WidgetListElementType,
                                  C4: WidgetListElementType,
                                  C5: WidgetListElementType,
                                  C6: WidgetListElementType,
                                  C7: WidgetListElementType>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> some WidgetList {
        Single(widget: c0)
            .append(c1)
            .append(c2)
            .append(c3)
            .append(c4)
            .append(c5)
            .append(c6)
            .append(c7)
    }
    
    public static func buildBlock<C0: WidgetListElementType,
                                  C1: WidgetListElementType,
                                  C2: WidgetListElementType,
                                  C3: WidgetListElementType,
                                  C4: WidgetListElementType,
                                  C5: WidgetListElementType,
                                  C6: WidgetListElementType,
                                  C7: WidgetListElementType,
                                  C8: WidgetListElementType>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> some WidgetList {
        Single(widget: c0)
            .append(c1)
            .append(c2)
            .append(c3)
            .append(c4)
            .append(c5)
            .append(c6)
            .append(c7)
            .append(c8)
    }
    
    public static func buildBlock<C0: WidgetListElementType,
                                  C1: WidgetListElementType,
                                  C2: WidgetListElementType,
                                  C3: WidgetListElementType,
                                  C4: WidgetListElementType,
                                  C5: WidgetListElementType,
                                  C6: WidgetListElementType,
                                  C7: WidgetListElementType,
                                  C8: WidgetListElementType,
                                  C9: WidgetListElementType>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> some WidgetList {
        Single(widget: c0)
            .append(c1)
            .append(c2)
            .append(c3)
            .append(c4)
            .append(c5)
            .append(c6)
            .append(c7)
            .append(c8)
            .append(c9)
    }
    
}

public protocol WidgetList {
    func widgetNodes(center: NotificationCenter) -> [SKNode]
}

/// 再帰可能. widget のペアです. オーバーヘッドはありません.
public struct RecursiveGroup<T: WidgetList, U: WidgetListElementType>: WidgetList {
    
    var first: T
    var second: U
    
    func append<V: WidgetListElementType>(_ newWidget: V) -> RecursiveGroup<Self, V> {
        .init(first: self, second: newWidget)
    }
    
    public func widgetNodes(center: NotificationCenter) -> [SKNode] {
        var result = self.first.widgetNodes(center: center)
        self.second.addTo(buffer: &result, center: center)
        return result
    }
    
}

// 一つの widget から RecursiveGroup を生成するためのラッパー.
struct Single<T: WidgetListElementType>: WidgetList {
    
    var widget: T
    
    func append<U: WidgetListElementType>(_ newWidget: U) -> RecursiveGroup<Self, U> {
        .init(first: self, second: newWidget)
    }
    
    func widgetNodes(center: NotificationCenter) -> [SKNode] {
        var result = [SKNode]()
        self.widget.addTo(buffer: &result, center: center)
        return result
    }
    
}

/// widget 数を増やす際に使用します. 10 個以下の widget を内包することができます.
/// - note: モディファイアはありませんが, メモリのオーバーヘッドがありません.
public struct Extension<Content: WidgetList>: WidgetListElementType {
    
    var content: Content
    
    public init(@GroupBuilder _ content: () -> Content) {
        self.content = content()
    }
    
    public func addTo(buffer: inout [SKNode], center: NotificationCenter) {
        for node in self.content.widgetNodes(center: center) {
            buffer.append(node)
        }
    }
    
}


