//
//  WidgetPlugins+.swift
//  
//
//  Created by rrbox on 2023/02/15.
//

import SpriteKit

// extensions

public extension NodeGenerator {
    func combine(node: Node, center: NotificationCenter) {
        
    }
    
    func createModels() -> (Node, NotificationCenter) {
        let center = NotificationCenter()
        let node = self.node()
        self.combine(node: node, center: center)
        return (node, center)
    }
}

public extension WidgetListElementType where Self: NodeGenerator {
    func addTo(buffer: inout [SKNode], center: NotificationCenter) {
        let node = self.node()
        self.combine(node: node, center: center)
        buffer.append(node)
    }
}

public extension NodeGenerator where Self: ContextPresentPlugIn, Context: ParameterLessGeneratable {
    func node() -> Node {
        self.node(context: Context())
    }
}

public extension DataOutputPlugIn {
    func combine(node: Node, center: NotificationCenter) {
        node.registerTo(center: center, id: self.id)
    }
}
