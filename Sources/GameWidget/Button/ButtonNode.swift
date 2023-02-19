//
//  ButtonNode.swift
//  
//
//  Created by rrbox on 2022/11/15.
//

import SpriteKit

public enum ActionType {
    case scale
    case alpha
}

public class ButtonNode: SKNode, PublisherNode {
    public weak var notificationSystem: WidgetNotificationSystem?
}

final class ButtonSensor: SKSpriteNode {
    
    override var isUserInteractionEnabled: Bool {
        get { true }
        set {}
    }
    
    var buttonNode: ButtonNode? {
        self.parent as? ButtonNode
    }
    
    var roleName: Button.Role?
    
    private var isSelected = false
    private var selectAction: SKAction?
    private var canselAction: SKAction?
    private var selectEndAction: SKAction?
    
    func setAction(type: ActionType) {
        switch type {
        case .scale:
            self.selectAction = SKAction.scale(to: 1.2, duration: 0.01)
            self.canselAction = SKAction.scale(to: 1.0, duration: 0.01)
            self.selectEndAction = SKAction.sequence([SKAction.scale(to: 0.8, duration: 0.05), SKAction.scale(to: 1.0, duration: 0.01)])
        case .alpha:
            self.selectAction = SKAction.run {
                self.run(SKAction.fadeAlpha(to: 0.5, duration: 0.05))
            }
            self.canselAction = SKAction.run {
                self.run(SKAction.fadeAlpha(to: 0.01, duration: 0.05))
            }
            self.selectEndAction = SKAction.run {
                self.run(SKAction.fadeAlpha(to: 0.01, duration: 0.05))
            }
        }
    }
    
    func select() {
        if !self.isSelected {
            self.parent?.run(self.selectAction!)
            self.isSelected = true
        }
    }
    
    func cancel() {
        if self.isSelected {
            self.parent?.run(self.canselAction!)
            self.isSelected = false
        }
    }
    
    func touchDown() {
        self.parent?.removeAllActions()
        self.parent?.run(self.selectAction!)
        self.isSelected = true
        self.buttonNode?.notificationSystem?.touchDownButton(self.roleName!)
    }
    
    func touchMoved(toPoint pos: CGPoint) {
        if !(self.parent!.atPoint(pos) == self) {
            self.cancel()
        } else {
            self.select()
        }
    }
    
    func touchUp() {
        if self.isSelected {
            self.removeAllActions()
            self.parent?.run(SKAction.sequence([
                self.selectEndAction!,
                SKAction.run {
                    self.isSelected = false
                    self.buttonNode?.notificationSystem?.touchUpButton(self.roleName!)
                }
            ]))
        }
    }
    
#if os(macOS)
    
    override func mouseDown(with event: NSEvent) {
        self.touchDown()
    }
    
    override func mouseDragged(with event: NSEvent) {
        self.touchMoved(toPoint: event.location(in: self.parent!))
    }
    
    override func mouseUp(with event: NSEvent) {
        self.touchUp()
    }
    
#elseif os(iOS)
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.touchDown()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            self.touchMoved(toPoint: touch.location(in: self.parent!))
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.touchUp()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.touchUp()
    }
    
#endif
    
}
