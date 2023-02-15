//
//  WidgetSample.swift
//  
//
//  Created by rrbox on 2022/12/03.
//

import SpriteKit
import GameWidget

struct TextNode: Widget {
    let value: String
    func node() -> SKNode {
        let node = SKNode()
        node.name = self.value
        return node
    }
}

