//
//  Widget+PlugIns.swift
//  
//
//  Created by rrbox on 2023/02/16.
//

import SpriteKit

public extension NodeGenerator {
    func combine(node: Node, center: WidgetNotificationSystem) {
        
    }
    
    func createModels() -> (Node, WidgetNotificationSystem) {
        let center = WidgetNotificationSystem()
        let node = self.node()
        self.combine(node: node, center: center)
        return (node, center)
    }
}

public extension WidgetListElementType where Self: NodeGenerator {
    func addTo(buffer: inout [SKNode], center: WidgetNotificationSystem) {
        let node = self.node()
        self.combine(node: node, center: center)
        buffer.append(node)
    }
}

public extension NodeGenerator where Self: ContextPresentPlugIn, Context: ParameterLessGeneratable {
    func node() -> Node {
        self.node(applying: Context())
    }
}

public extension DataOutputPlugIn {
    func combine(node: Node, center: WidgetNotificationSystem) {
        node.registerTo(center: center, id: self.id)
    }
}
