//
//  Widget.swift
//  GameWidget
//
//  Created by rrbox on 2022/03/10.
//


import SpriteKit
import GameplayKit


public protocol Widget {
    func node() -> SKNode
}

@resultBuilder public struct UIFunction {
    public static func buildBlock<Part: Widget>(_ components: Part...) -> [Part] {
        components
    }
}

public struct Display {
    
    public init() {}
    
    
    func node() -> SKNode {
        let result = SKNode()
        for item in self.items {
            result.addChild(item.node())
        }
        return result
    }
    

    var items = [Widget]()
    
    public func place<Part: Widget>(@UIFunction item: () -> [Part]) -> Self {

        var result = self
        for i in item() {
            result.items.append(i)
        }
        return result
    }
    
}
