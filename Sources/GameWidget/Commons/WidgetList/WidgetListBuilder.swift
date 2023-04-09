//
//  WidgetListBuilder.swift
//  
//
//  Created by rrbox on 2022/07/24.
//

import CoreGraphics
import SpriteKit

@resultBuilder public struct GroupBuilder {
    
    public static func buildBlock<C0: WidgetListElementType>(_ c0: C0) -> some WidgetListProtocol {
        Single(widget: c0)
    }
    
    public static func buildBlock<C0: WidgetListElementType,
                                  C1: WidgetListElementType>(_ c0: C0, _ c1: C1) -> some WidgetListProtocol {
        WidgetList2(c0, c1)
    }
    
    public static func buildBlock<C0: WidgetListElementType,
                                  C1: WidgetListElementType,
                                  C2: WidgetListElementType>(_ c0: C0, _ c1: C1, _ c2: C2) -> some WidgetListProtocol {
        WidgetList3(c0, c1, c2)
    }
    
    public static func buildBlock<C0: WidgetListElementType,
                                  C1: WidgetListElementType,
                                  C2: WidgetListElementType,
                                  C3: WidgetListElementType>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> some WidgetListProtocol {
        WidgetList4(c0, c1, c2, c3)
    }
    
    public static func buildBlock<C0: WidgetListElementType,
                                  C1: WidgetListElementType,
                                  C2: WidgetListElementType,
                                  C3: WidgetListElementType,
                                  C4: WidgetListElementType>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> some WidgetListProtocol {
        WidgetList5(c0, c1, c2, c3, c4)
    }
    
    public static func buildBlock<C0: WidgetListElementType,
                                  C1: WidgetListElementType,
                                  C2: WidgetListElementType,
                                  C3: WidgetListElementType,
                                  C4: WidgetListElementType,
                                  C5: WidgetListElementType>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> some WidgetListProtocol {
        WidgetList6(c0, c1, c2, c3, c4, c5)
    }
    
    public static func buildBlock<C0: WidgetListElementType,
                                  C1: WidgetListElementType,
                                  C2: WidgetListElementType,
                                  C3: WidgetListElementType,
                                  C4: WidgetListElementType,
                                  C5: WidgetListElementType,
                                  C6: WidgetListElementType>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> some WidgetListProtocol {
        WidgetList7(c0, c1, c2, c3, c4, c5, c6)
    }
    
    public static func buildBlock<C0: WidgetListElementType,
                                  C1: WidgetListElementType,
                                  C2: WidgetListElementType,
                                  C3: WidgetListElementType,
                                  C4: WidgetListElementType,
                                  C5: WidgetListElementType,
                                  C6: WidgetListElementType,
                                  C7: WidgetListElementType>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> some WidgetListProtocol {
        WidgetList8(c0, c1, c2, c3, c4, c5, c6, c7)
    }
    
    public static func buildBlock<C0: WidgetListElementType,
                                  C1: WidgetListElementType,
                                  C2: WidgetListElementType,
                                  C3: WidgetListElementType,
                                  C4: WidgetListElementType,
                                  C5: WidgetListElementType,
                                  C6: WidgetListElementType,
                                  C7: WidgetListElementType,
                                  C8: WidgetListElementType>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> some WidgetListProtocol {
        WidgetList9(c0, c1, c2, c3, c4, c5, c6, c7, c8)
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
                                  C9: WidgetListElementType>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> some WidgetListProtocol {
        WidgetList10(c0, c1, c2, c3, c4, c5, c6, c7, c8, c9)
    }
    
}

public protocol WidgetListProtocol {
    func widgetNodes(center: WidgetNotificationSystem) -> [SKNode]
}
