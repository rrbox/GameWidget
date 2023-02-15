//
//  Standard+Context+DataOutputPlugIn.swift
//  
//
//  Created by rrbox on 2023/02/12.
//

import SpriteKit
import GameWidget

class ObserveableLabel: SKLabelNode, ObserveableNode {
    typealias Identifier = String
    
    func getText(from notification: Notification) -> String? {
        notification.userInfo?["text"] as? String
    }
    
    @objc func updateText(notification: Notification) {
        self.text = self.getText(from: notification)
    }
    
    func registerTo(center: NotificationCenter, id: String) {
        center.addObserver(self, selector: #selector(self.updateText(notification:)), name: .init(id), object: nil)
    }
}

struct WidgetCase_2: Widget, ContextPresentPlugIn, DataOutputPlugIn {
    var id: String
    
    func node(context: WidgetCaseContext) -> ObserveableLabel {
        return ObserveableLabel(text: context.text)
    }
}
