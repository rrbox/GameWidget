//
//  Button.swift
//  GameWidget
//
//  Created by rrbox on 2022/03/10.
//

import SpriteKit
import GameplayKit

@objc public protocol ButtonResopnder {
    
    @objc func touchDownButton(notification: Notification)
    
    @objc func touchUpButton(notification: Notification)
    
}

final public class ButtonNotificationCenter: NSObject {
    
    let center: NotificationCenter
    private static weak var activated: ButtonNotificationCenter?
    
    public override init() {
        self.center = NotificationCenter()
    }
    
    public func activate() {
        ButtonNotificationCenter.activated = self
    }
    
    func touchDownButton(_ button: Button.Role) {
        self.center.post(name: .buttonTouchDown, object: nil, userInfo: ["buttonName": button])
    }
    
    func touchUpButton(_ button: Button.Role) {
        self.center.post(name: .buttonTouchUp, object: nil, userInfo: ["buttonName": button])
    }
    
    static func touchDownButton(_ button: Button.Role) {
        ButtonNotificationCenter.activated?.touchDownButton(button)
    }
    
    static func touchUpButton(_ button: Button.Role) {
        ButtonNotificationCenter.activated?.touchUpButton(button)
    }
    
}

extension Notification.Name {
    
    static let buttonTouchDown = Notification.Name("ButtonNode.touchDown")
    
    static let buttonTouchUp = Notification.Name("ButtonNode.touchUp")
    
}

public extension ButtonResopnder {
    
    func getButtonEvent(_ notification: Notification) -> Button.Role {
        notification.userInfo!["buttonName"] as! Button.Role
    }
    
    func registerTo(_ system: ButtonNotificationCenter) {
        system.center.addObserver(self, selector: #selector(touchDownButton(notification:)), name: .buttonTouchDown, object: nil)
        system.center.addObserver(self, selector: #selector(touchUpButton(notification:)), name: .buttonTouchUp, object: nil)
    }
    
    func removeFrom(_ system: ButtonNotificationCenter) {
        system.center.removeObserver(self)
    }
    
}

public enum ActionType {
    case scale
    case alpha
}

fileprivate final class ButtonSensor: SKSpriteNode {
    
    override var isUserInteractionEnabled: Bool {
        get { true }
        set {}
    }
    
    var roleName: Button.Role?
    
    private var isSelected = false
    private var selectAction: SKAction?
    private var canselAction: SKAction?
    private var selectEndAction: SKAction?
    
    fileprivate func setAction(type: ActionType) {
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
//        UserInterfaceSystem.activated?.center.post(name: .buttonTouchUp, object: nil, userInfo: ["buttonName": self.roleName!])
        ButtonNotificationCenter.touchDownButton(self.roleName!)
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
//                    UserInterfaceSystem.activated?.center.post(name: .buttonTouchUp, object: nil, userInfo: ["buttonName": self.roleName!])
                    ButtonNotificationCenter.touchUpButton(self.roleName!)
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

public struct Button {
    
    public struct Role: Equatable {
        let name: String
        public init(_ name: String) {
            self.name = name
        }
    }
    
    private let name: Role
    private var color = SKColor.white
    private var position = CGPoint.zero
    private var size = CGSize(width: 32, height: 32)
    private var text: String?
    private var actionType = ActionType.scale
    
    public init(_ name: Role) {
        self.name = name
    }
    
    @discardableResult public func position(_ value: CGPoint) -> Self {
        var result = self
        result.position = value
        return result
    }
    
    @discardableResult public func size(_ value: CGSize) -> Self {
        var result = self
        result.size = value
        return result
    }
    
    @discardableResult public func color(_ value: SKColor) -> Self {
        var result = self
        result.color = value
        return result
    }
    
    @discardableResult public func text(_ value: String) -> Self {
        var result = self
        result.text = value
        return result
    }
    
    @discardableResult public func actionType(_ value: ActionType) -> Self {
        var result = self
        result.actionType = value
        return result
    }
    
}

extension Button: Widget {
    
    public func node() -> SKNode {
        let result = SKNode()
        
        let sensor = ButtonSensor(color: self.color, size: self.size)
        sensor.alpha = 0.01
        sensor.roleName = self.name
        sensor.setAction(type: self.actionType)
        result.addChild(sensor)
        
        let label = SKLabelNode(text: self.text ?? "\(self.name)")
        label.verticalAlignmentMode = .center
        label.zPosition = -1
        result.addChild(label)
        result.position = self.position
        
        return result
    }
    
}
