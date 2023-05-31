//
//  WidgetTuple.swift
//  
//
//  Created by rrbox on 2023/04/18.
//

import SpriteKit

public protocol WidgetTupleProtocol: SplittingFrameElementType {
    func addTo(buffer: inout [SKNode], frames: [WidgetFrame], center: WidgetNotificationSystem)
}

public struct Single<Content: WidgetListElementType>: WidgetTupleProtocol {
    let widget: Content
    init(widget: Content) {
        self.widget = widget
    }
    
    public var countOfNodes: Int {
        self.widget.countOfNodes
    }
    
    public func addTo(buffer: inout [SKNode], frames: [WidgetFrame], center: WidgetNotificationSystem) {
        self.widget.addTo(buffer: &buffer, frame: frames[0], center: center)
    }
}

public struct WidgetTuple2<C0: WidgetListElementType, C1: WidgetListElementType>: WidgetTupleProtocol {
    let widgets: (C0, C1)
    init(widgets: (C0, C1)) {
        self.widgets = widgets
    }
    public var countOfNodes: Int {
        self.widgets.0.countOfNodes + self.widgets.1.countOfNodes
    }
    
    public func addTo(buffer: inout [SKNode], frames: [WidgetFrame], center: WidgetNotificationSystem) {
        self.widgets.0.addTo(buffer: &buffer, frame: frames[0], center: center)
        self.widgets.1.addTo(buffer: &buffer, frame: frames[1], center: center)
    }
}

public struct WidgetTuple3<C0: WidgetListElementType,
                           C1: WidgetListElementType,
                           C2: WidgetListElementType>: WidgetTupleProtocol {
    let widgets: (C0, C1, C2)
    init(widgets: (C0, C1, C2)) {
        self.widgets = widgets
    }
    public var countOfNodes: Int {
        self.widgets.0.countOfNodes +
        self.widgets.1.countOfNodes +
        self.widgets.2.countOfNodes
    }
    
    public func addTo(buffer: inout [SKNode], frames: [WidgetFrame], center: WidgetNotificationSystem) {
        self.widgets.0.addTo(buffer: &buffer, frame: frames[0], center: center)
        self.widgets.1.addTo(buffer: &buffer, frame: frames[1], center: center)
        self.widgets.2.addTo(buffer: &buffer, frame: frames[2], center: center)
    }
}

public struct WidgetTuple4<C0: WidgetListElementType,
                           C1: WidgetListElementType,
                           C2: WidgetListElementType,
                           C3: WidgetListElementType>: WidgetTupleProtocol {
    let widgets: (C0, C1, C2, C3)
    
    init(widgets: (C0, C1, C2, C3)) {
        self.widgets = widgets
    }
    
    public var countOfNodes: Int {
        self.widgets.0.countOfNodes +
        self.widgets.1.countOfNodes +
        self.widgets.2.countOfNodes +
        self.widgets.3.countOfNodes
    }
    
    public func addTo(buffer: inout [SKNode], frames: [WidgetFrame], center: WidgetNotificationSystem) {
        self.widgets.0.addTo(buffer: &buffer, frame: frames[0], center: center)
        self.widgets.1.addTo(buffer: &buffer, frame: frames[1], center: center)
        self.widgets.2.addTo(buffer: &buffer, frame: frames[2], center: center)
        self.widgets.3.addTo(buffer: &buffer, frame: frames[3], center: center)
    }
}

public struct WidgetTuple5<C0: WidgetListElementType,
                           C1: WidgetListElementType,
                           C2: WidgetListElementType,
                           C3: WidgetListElementType,
                           C4: WidgetListElementType>: WidgetTupleProtocol {
    let widgets: (C0, C1, C2, C3, C4)
    
    init(widgets: (C0, C1, C2, C3, C4)) {
        self.widgets = widgets
    }
    
    public var countOfNodes: Int {
        self.widgets.0.countOfNodes +
        self.widgets.1.countOfNodes +
        self.widgets.2.countOfNodes +
        self.widgets.3.countOfNodes +
        self.widgets.4.countOfNodes
    }
    
    public func addTo(buffer: inout [SKNode], frames: [WidgetFrame], center: WidgetNotificationSystem) {
        self.widgets.0.addTo(buffer: &buffer, frame: frames[0], center: center)
        self.widgets.1.addTo(buffer: &buffer, frame: frames[1], center: center)
        self.widgets.2.addTo(buffer: &buffer, frame: frames[2], center: center)
        self.widgets.3.addTo(buffer: &buffer, frame: frames[3], center: center)
        self.widgets.4.addTo(buffer: &buffer, frame: frames[4], center: center)
    }
    
}

public struct WidgetTuple6<C0: WidgetListElementType,
                           C1: WidgetListElementType,
                           C2: WidgetListElementType,
                           C3: WidgetListElementType,
                           C4: WidgetListElementType,
                           C5: WidgetListElementType>: WidgetTupleProtocol {
    let widgets: (C0, C1, C2, C3, C4, C5)
    
    init(widgets: (C0, C1, C2, C3, C4, C5)) {
        self.widgets = widgets
    }
    
    public var countOfNodes: Int {
        self.widgets.0.countOfNodes +
        self.widgets.1.countOfNodes +
        self.widgets.2.countOfNodes +
        self.widgets.3.countOfNodes +
        self.widgets.4.countOfNodes +
        self.widgets.5.countOfNodes
    }
    
    public func addTo(buffer: inout [SKNode], frames: [WidgetFrame], center: WidgetNotificationSystem) {
        self.widgets.0.addTo(buffer: &buffer, frame: frames[0], center: center)
        self.widgets.1.addTo(buffer: &buffer, frame: frames[1], center: center)
        self.widgets.2.addTo(buffer: &buffer, frame: frames[2], center: center)
        self.widgets.3.addTo(buffer: &buffer, frame: frames[3], center: center)
        self.widgets.4.addTo(buffer: &buffer, frame: frames[4], center: center)
        self.widgets.5.addTo(buffer: &buffer, frame: frames[5], center: center)
    }
}

public struct WidgetTuple7<C0: WidgetListElementType,
                           C1: WidgetListElementType,
                           C2: WidgetListElementType,
                           C3: WidgetListElementType,
                           C4: WidgetListElementType,
                           C5: WidgetListElementType,
                           C6: WidgetListElementType>: WidgetTupleProtocol {
    let widgets: (C0, C1, C2, C3, C4, C5, C6)
    
    init(widgets: (C0, C1, C2, C3, C4, C5, C6)) {
        self.widgets = widgets
    }
    
    public var countOfNodes: Int {
        self.widgets.0.countOfNodes + self.widgets.1.countOfNodes + self.widgets.2.countOfNodes + self.widgets.3.countOfNodes + self.widgets.4.countOfNodes + self.widgets.5.countOfNodes + self.widgets.6.countOfNodes
    }
    
    public func addTo(buffer: inout [SKNode], frames: [WidgetFrame], center: WidgetNotificationSystem) {
        self.widgets.0.addTo(buffer: &buffer, frame: frames[0], center: center)
        self.widgets.1.addTo(buffer: &buffer, frame: frames[1], center: center)
        self.widgets.2.addTo(buffer: &buffer, frame: frames[2], center: center)
        self.widgets.3.addTo(buffer: &buffer, frame: frames[3], center: center)
        self.widgets.4.addTo(buffer: &buffer, frame: frames[4], center: center)
        self.widgets.5.addTo(buffer: &buffer, frame: frames[5], center: center)
        self.widgets.6.addTo(buffer: &buffer, frame: frames[6], center: center)
    }
}

public struct WidgetTuple8<C0: WidgetListElementType,
                           C1: WidgetListElementType,
                           C2: WidgetListElementType,
                           C3: WidgetListElementType,
                           C4: WidgetListElementType,
                           C5: WidgetListElementType,
                           C6: WidgetListElementType,
                           C7: WidgetListElementType>: WidgetTupleProtocol {
    let widgets: (C0, C1, C2, C3, C4, C5, C6, C7)
    
    init(widgets: (C0, C1, C2, C3, C4, C5, C6, C7)) {
        self.widgets = widgets
    }
    
    public var countOfNodes: Int {
        self.widgets.0.countOfNodes +
        self.widgets.1.countOfNodes +
        self.widgets.2.countOfNodes +
        self.widgets.3.countOfNodes +
        self.widgets.4.countOfNodes +
        self.widgets.5.countOfNodes +
        self.widgets.6.countOfNodes +
        self.widgets.7.countOfNodes
    }
    
    public func addTo(buffer: inout [SKNode], frames: [WidgetFrame], center: WidgetNotificationSystem) {
        self.widgets.0.addTo(buffer: &buffer, frame: frames[0], center: center)
        self.widgets.1.addTo(buffer: &buffer, frame: frames[1], center: center)
        self.widgets.2.addTo(buffer: &buffer, frame: frames[2], center: center)
        self.widgets.3.addTo(buffer: &buffer, frame: frames[3], center: center)
        self.widgets.4.addTo(buffer: &buffer, frame: frames[4], center: center)
        self.widgets.5.addTo(buffer: &buffer, frame: frames[5], center: center)
        self.widgets.6.addTo(buffer: &buffer, frame: frames[6], center: center)
        self.widgets.7.addTo(buffer: &buffer, frame: frames[7], center: center)
    }
    
}

public struct WidgetTuple9<C0: WidgetListElementType,
                           C1: WidgetListElementType,
                           C2: WidgetListElementType,
                           C3: WidgetListElementType,
                           C4: WidgetListElementType,
                           C5: WidgetListElementType,
                           C6: WidgetListElementType,
                           C7: WidgetListElementType,
                           C8: WidgetListElementType>: WidgetTupleProtocol {
    let widgets: (C0, C1, C2, C3, C4, C5, C6, C7, C8)
    
    init(widgets: (C0, C1, C2, C3, C4, C5, C6, C7, C8)) {
        self.widgets = widgets
    }
    
    public var countOfNodes: Int {
        self.widgets.0.countOfNodes +
        self.widgets.1.countOfNodes +
        self.widgets.2.countOfNodes +
        self.widgets.3.countOfNodes +
        self.widgets.4.countOfNodes +
        self.widgets.5.countOfNodes +
        self.widgets.6.countOfNodes +
        self.widgets.7.countOfNodes +
        self.widgets.8.countOfNodes
    }
    
    public func addTo(buffer: inout [SKNode], frames: [WidgetFrame], center: WidgetNotificationSystem) {
        self.widgets.0.addTo(buffer: &buffer, frame: frames[0], center: center)
        self.widgets.1.addTo(buffer: &buffer, frame: frames[1], center: center)
        self.widgets.2.addTo(buffer: &buffer, frame: frames[2], center: center)
        self.widgets.3.addTo(buffer: &buffer, frame: frames[3], center: center)
        self.widgets.4.addTo(buffer: &buffer, frame: frames[4], center: center)
        self.widgets.5.addTo(buffer: &buffer, frame: frames[5], center: center)
        self.widgets.6.addTo(buffer: &buffer, frame: frames[6], center: center)
        self.widgets.7.addTo(buffer: &buffer, frame: frames[7], center: center)
        self.widgets.8.addTo(buffer: &buffer, frame: frames[8], center: center)
    }
}

public struct WidgetTuple10<C0: WidgetListElementType,
                            C1: WidgetListElementType,
                            C2: WidgetListElementType,
                            C3: WidgetListElementType,
                            C4: WidgetListElementType,
                            C5: WidgetListElementType,
                            C6: WidgetListElementType,
                            C7: WidgetListElementType,
                            C8: WidgetListElementType,
                            C9: WidgetListElementType>: WidgetTupleProtocol {
    let widgets: (C0, C1, C2, C3, C4, C5, C6, C7, C8, C9)
    
    init(widgets: (C0, C1, C2, C3, C4, C5, C6, C7, C8, C9)) {
        self.widgets = widgets
    }
    
    public var countOfNodes: Int {
        self.widgets.0.countOfNodes +
        self.widgets.1.countOfNodes +
        self.widgets.2.countOfNodes +
        self.widgets.3.countOfNodes +
        self.widgets.4.countOfNodes +
        self.widgets.5.countOfNodes +
        self.widgets.6.countOfNodes +
        self.widgets.7.countOfNodes +
        self.widgets.8.countOfNodes +
        self.widgets.9.countOfNodes
    }
    
    public func addTo(buffer: inout [SKNode], frames: [WidgetFrame], center: WidgetNotificationSystem) {
        self.widgets.0.addTo(buffer: &buffer, frame: frames[0], center: center)
        self.widgets.1.addTo(buffer: &buffer, frame: frames[1], center: center)
        self.widgets.2.addTo(buffer: &buffer, frame: frames[2], center: center)
        self.widgets.3.addTo(buffer: &buffer, frame: frames[3], center: center)
        self.widgets.4.addTo(buffer: &buffer, frame: frames[4], center: center)
        self.widgets.5.addTo(buffer: &buffer, frame: frames[5], center: center)
        self.widgets.6.addTo(buffer: &buffer, frame: frames[6], center: center)
        self.widgets.7.addTo(buffer: &buffer, frame: frames[7], center: center)
        self.widgets.8.addTo(buffer: &buffer, frame: frames[8], center: center)
        self.widgets.9.addTo(buffer: &buffer, frame: frames[9], center: center)
    }
}

@resultBuilder public struct WidgetTupleBuilder {
    public static func buildBlock<Content: WidgetListElementType>(_ content: Content) -> some WidgetTupleProtocol {
        Single(widget: content)
    }
    
    public static func buildBlock<C0: WidgetListElementType,
                                  C1: WidgetListElementType>(_ c0: C0, _ c1: C1) -> some WidgetTupleProtocol {
        WidgetTuple2(widgets: (c0, c1))
    }
    
    public static func buildBlock<C0: WidgetListElementType,
                                  C1: WidgetListElementType,
                                  C2: WidgetListElementType>(_ c0: C0, _ c1: C1, _ c2: C2) -> some WidgetTupleProtocol {
        WidgetTuple3(widgets: (c0, c1, c2))
    }
    
    public static func buildBlock<C0: WidgetListElementType,
                                  C1: WidgetListElementType,
                                  C2: WidgetListElementType,
                                  C3: WidgetListElementType>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> some WidgetTupleProtocol {
        WidgetTuple4(widgets: (c0, c1, c2, c3))
    }

    public static func buildBlock<C0: WidgetListElementType,
                                  C1: WidgetListElementType,
                                  C2: WidgetListElementType,
                                  C3: WidgetListElementType,
                                  C4: WidgetListElementType>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> some WidgetTupleProtocol {
        WidgetTuple5(widgets: (c0, c1, c2, c3, c4))
    }
    
    public static func buildBlock<C0: WidgetListElementType,
                                  C1: WidgetListElementType,
                                  C2: WidgetListElementType,
                                  C3: WidgetListElementType,
                                  C4: WidgetListElementType,
                                  C5: WidgetListElementType>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> some WidgetTupleProtocol {
        WidgetTuple6(widgets: (c0, c1, c2, c3, c4, c5))
    }
    
    public static func buildBlock<C0: WidgetListElementType,
                                  C1: WidgetListElementType,
                                  C2: WidgetListElementType,
                                  C3: WidgetListElementType,
                                  C4: WidgetListElementType,
                                  C5: WidgetListElementType,
                                  C6: WidgetListElementType>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> some WidgetTupleProtocol {
        WidgetTuple7(widgets: (c0, c1, c2, c3, c4, c5, c6))
    }
    
    public static func buildBlock<C0: WidgetListElementType,
                                  C1: WidgetListElementType,
                                  C2: WidgetListElementType,
                                  C3: WidgetListElementType,
                                  C4: WidgetListElementType,
                                  C5: WidgetListElementType,
                                  C6: WidgetListElementType,
                                  C7: WidgetListElementType>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> some WidgetTupleProtocol {
        WidgetTuple8(widgets: (c0, c1, c2, c3, c4, c5, c6, c7))
    }
    
    public static func buildBlock<C0: WidgetListElementType,
                                  C1: WidgetListElementType,
                                  C2: WidgetListElementType,
                                  C3: WidgetListElementType,
                                  C4: WidgetListElementType,
                                  C5: WidgetListElementType,
                                  C6: WidgetListElementType,
                                  C7: WidgetListElementType,
                                  C8: WidgetListElementType>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> some WidgetTupleProtocol {
        WidgetTuple9(widgets: (c0, c1, c2, c3, c4, c5, c6, c7, c8))
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
                                  C9: WidgetListElementType>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> some WidgetTupleProtocol {
        WidgetTuple10(widgets: (c0, c1, c2, c3, c4, c5, c6, c7, c8, c9))
    }
}
