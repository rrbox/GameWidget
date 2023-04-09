//
//  WidgetList.swift
//  
//
//  Created by rrbox on 2023/04/09.
//

import SpriteKit

// 一つの widget から RecursiveGroup を生成するためのラッパー.
struct Single<T: WidgetListElementType>: WidgetListProtocol {
    
    var widget: T
    
    func widgetNodes(center: WidgetNotificationSystem) -> [SKNode] {
        var result = [SKNode]()
        self.widget.addTo(buffer: &result, center: center)
        return result
    }
    
}

public struct WidgetList2<C0: WidgetListElementType, C1: WidgetListElementType>: WidgetListProtocol {
    let widgets: (C0, C1)
    
    public init(_ c0: C0, _ c1: C1) {
        self.widgets = (c0, c1)
    }
    
    public func widgetNodes(center: WidgetNotificationSystem) -> [SKNode] {
        var result = [SKNode]()
        self.widgets.0.addTo(buffer: &result, center: center)
        self.widgets.1.addTo(buffer: &result, center: center)
        return result
    }
    
}

public struct WidgetList3<C0: WidgetListElementType, C1: WidgetListElementType, C2: WidgetListElementType>: WidgetListProtocol {
    let widgets: (C0, C1, C2)
    
    public init(_ c0: C0, _ c1: C1, _ c2: C2) {
        self.widgets = (c0, c1, c2)
    }
    
    public func widgetNodes(center: WidgetNotificationSystem) -> [SKNode] {
        var result = [SKNode]()
        self.widgets.0.addTo(buffer: &result, center: center)
        self.widgets.1.addTo(buffer: &result, center: center)
        self.widgets.2.addTo(buffer: &result, center: center)
        return result
    }
    
}

public struct WidgetList4<C0: WidgetListElementType, C1: WidgetListElementType, C2: WidgetListElementType, C3: WidgetListElementType>: WidgetListProtocol {
    let widgets: (C0, C1, C2, C3)
    
    public init(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) {
        self.widgets = (c0, c1, c2, c3)
    }
    
    public func widgetNodes(center: WidgetNotificationSystem) -> [SKNode] {
        var result = [SKNode]()
        self.widgets.0.addTo(buffer: &result, center: center)
        self.widgets.1.addTo(buffer: &result, center: center)
        self.widgets.2.addTo(buffer: &result, center: center)
        self.widgets.3.addTo(buffer: &result, center: center)
        return result
    }
    
}

public struct WidgetList5<C0: WidgetListElementType, C1: WidgetListElementType, C2: WidgetListElementType, C3: WidgetListElementType, C4: WidgetListElementType>: WidgetListProtocol {
    let widgets: (C0, C1, C2, C3, C4)
    
    public init(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) {
        self.widgets = (c0, c1, c2, c3, c4)
    }
    
    public func widgetNodes(center: WidgetNotificationSystem) -> [SKNode] {
        var result = [SKNode]()
        self.widgets.0.addTo(buffer: &result, center: center)
        self.widgets.1.addTo(buffer: &result, center: center)
        self.widgets.2.addTo(buffer: &result, center: center)
        self.widgets.3.addTo(buffer: &result, center: center)
        self.widgets.4.addTo(buffer: &result, center: center)
        return result
    }
    
}

public struct WidgetList6<C0: WidgetListElementType, C1: WidgetListElementType, C2: WidgetListElementType, C3: WidgetListElementType, C4: WidgetListElementType, C5: WidgetListElementType>: WidgetListProtocol {
    let widgets: (C0, C1, C2, C3, C4, C5)
    
    public init(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) {
        self.widgets = (c0, c1, c2, c3, c4, c5)
    }
    
    public func widgetNodes(center: WidgetNotificationSystem) -> [SKNode] {
        var result = [SKNode]()
        self.widgets.0.addTo(buffer: &result, center: center)
        self.widgets.1.addTo(buffer: &result, center: center)
        self.widgets.2.addTo(buffer: &result, center: center)
        self.widgets.3.addTo(buffer: &result, center: center)
        self.widgets.4.addTo(buffer: &result, center: center)
        self.widgets.5.addTo(buffer: &result, center: center)
        return result
    }
}

public struct WidgetList7<C0: WidgetListElementType, C1: WidgetListElementType, C2: WidgetListElementType, C3: WidgetListElementType, C4: WidgetListElementType, C5: WidgetListElementType, C6: WidgetListElementType>: WidgetListProtocol {
    let widgets: (C0, C1, C2, C3, C4, C5, C6)
    
    public init(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) {
        self.widgets = (c0, c1, c2, c3, c4, c5, c6)
    }
    
    public func widgetNodes(center: WidgetNotificationSystem) -> [SKNode] {
        var result = [SKNode]()
        self.widgets.0.addTo(buffer: &result, center: center)
        self.widgets.1.addTo(buffer: &result, center: center)
        self.widgets.2.addTo(buffer: &result, center: center)
        self.widgets.3.addTo(buffer: &result, center: center)
        self.widgets.4.addTo(buffer: &result, center: center)
        self.widgets.5.addTo(buffer: &result, center: center)
        self.widgets.6.addTo(buffer: &result, center: center)
        return result
    }
}

public struct WidgetList8<C0: WidgetListElementType, C1: WidgetListElementType, C2: WidgetListElementType, C3: WidgetListElementType, C4: WidgetListElementType, C5: WidgetListElementType, C6: WidgetListElementType, C7: WidgetListElementType>: WidgetListProtocol {
    let widgets: (C0, C1, C2, C3, C4, C5, C6, C7)
    
    public init(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) {
        self.widgets = (c0, c1, c2, c3, c4, c5, c6, c7)
    }
    
    public func widgetNodes(center: WidgetNotificationSystem) -> [SKNode] {
        var result = [SKNode]()
        self.widgets.0.addTo(buffer: &result, center: center)
        self.widgets.1.addTo(buffer: &result, center: center)
        self.widgets.2.addTo(buffer: &result, center: center)
        self.widgets.3.addTo(buffer: &result, center: center)
        self.widgets.4.addTo(buffer: &result, center: center)
        self.widgets.5.addTo(buffer: &result, center: center)
        self.widgets.6.addTo(buffer: &result, center: center)
        self.widgets.7.addTo(buffer: &result, center: center)
        return result
    }
}

public struct WidgetList9<C0: WidgetListElementType, C1: WidgetListElementType, C2: WidgetListElementType, C3: WidgetListElementType, C4: WidgetListElementType, C5: WidgetListElementType, C6: WidgetListElementType, C7: WidgetListElementType, C8: WidgetListElementType>: WidgetListProtocol {
    let widgets: (C0, C1, C2, C3, C4, C5, C6, C7, C8)
    
    public init(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) {
        self.widgets = (c0, c1, c2, c3, c4, c5, c6, c7, c8)
    }
    
    public func widgetNodes(center: WidgetNotificationSystem) -> [SKNode] {
        var result = [SKNode]()
        self.widgets.0.addTo(buffer: &result, center: center)
        self.widgets.1.addTo(buffer: &result, center: center)
        self.widgets.2.addTo(buffer: &result, center: center)
        self.widgets.3.addTo(buffer: &result, center: center)
        self.widgets.4.addTo(buffer: &result, center: center)
        self.widgets.5.addTo(buffer: &result, center: center)
        self.widgets.6.addTo(buffer: &result, center: center)
        self.widgets.7.addTo(buffer: &result, center: center)
        self.widgets.8.addTo(buffer: &result, center: center)
        return result
    }
}

public struct WidgetList10<C0: WidgetListElementType, C1: WidgetListElementType, C2: WidgetListElementType, C3: WidgetListElementType, C4: WidgetListElementType, C5: WidgetListElementType, C6: WidgetListElementType, C7: WidgetListElementType, C8: WidgetListElementType, C9: WidgetListElementType>: WidgetListProtocol {
    let widgets: (C0, C1, C2, C3, C4, C5, C6, C7, C8, C9)
    
    public init(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) {
        self.widgets = (c0, c1, c2, c3, c4, c5, c6, c7, c8, c9)
    }
    
    public func widgetNodes(center: WidgetNotificationSystem) -> [SKNode] {
        var result = [SKNode]()
        self.widgets.0.addTo(buffer: &result, center: center)
        self.widgets.1.addTo(buffer: &result, center: center)
        self.widgets.2.addTo(buffer: &result, center: center)
        self.widgets.3.addTo(buffer: &result, center: center)
        self.widgets.4.addTo(buffer: &result, center: center)
        self.widgets.5.addTo(buffer: &result, center: center)
        self.widgets.6.addTo(buffer: &result, center: center)
        self.widgets.7.addTo(buffer: &result, center: center)
        self.widgets.8.addTo(buffer: &result, center: center)
        self.widgets.9.addTo(buffer: &result, center: center)
        return result
    }
}
