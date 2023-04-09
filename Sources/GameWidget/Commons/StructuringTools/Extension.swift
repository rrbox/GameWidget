//
//  Extension.swift
//  
//
//  Created by rrbox on 2023/02/23.
//

import SpriteKit

/// widget 数を増やす際に使用します. 10 個以下の widget を内包することができます.
/// - note: モディファイアはありませんが, メモリのオーバーヘッドがありません.
public struct Extension<Content: WidgetListProtocol>: WidgetListElementType {
    
    var content: Content
    
    public init(@GroupBuilder _ content: () -> Content) {
        self.content = content()
    }
    
    public func addTo(buffer: inout [SKNode], center: WidgetNotificationSystem) {
        for node in self.content.widgetNodes(center: center) {
            buffer.append(node)
        }
    }
    
}


