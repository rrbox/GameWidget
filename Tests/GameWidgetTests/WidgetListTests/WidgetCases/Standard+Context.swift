//
//  Standard+Context.swift
//  
//
//  Created by rrbox on 2023/02/12.
//

import SpriteKit
import GameWidget

struct WidgetCase_1: Widget, ContextPresentPlugIn {
    func node(context: WidgetCaseContext) -> some SKNode {
        return SKLabelNode(text: context.text)
    }
}
