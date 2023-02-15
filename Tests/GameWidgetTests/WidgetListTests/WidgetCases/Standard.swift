//
//  Standard.swift
//  
//
//  Created by rrbox on 2023/02/12.
//

import SpriteKit
import GameWidget

struct WidgetCase_0: Widget {
    func node() -> some SKNode {
        SKLabelNode(text: "Hello, World!")
    }
}
