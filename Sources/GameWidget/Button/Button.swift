//
//  Button.swift
//  GameWidget
//
//  Created by rrbox on 2022/03/10.
//

import SpriteKit
import GameplayKit

public struct ButtonContext: ContextProtocol, PositionContextProtocol {
    public init() {}
    
    var color = SKColor.white
    public var position = CGPoint.zero
    var text: String?
    var actionType = ActionType.scale
}

public enum ButtonModifiers {
    public struct Color: Modifier {
        public typealias Context = ButtonContext
        var value: SKColor
        
        public func mod(context: inout ButtonContext) {
            context.color = self.value
        }
    }
    
    public struct Text: Modifier {
        public typealias Context = ButtonContext
        var value: String?
        
        public func mod(context: inout ButtonContext) {
            context.text = self.value
        }
    }
    
    public struct Action: Modifier {
        public typealias Context = ButtonContext
        var value: ActionType
        
        public func mod(context: inout ButtonContext) {
            context.actionType = self.value
        }
    }

}

public extension ModifiableWidget where Context == ButtonContext {
    func color(_ value: SKColor) -> Next<ButtonModifiers.Color> {
        self.modifier(mod: ButtonModifiers.Color(value: value))
    }
    
    func text(_ value: String?) -> Next<ButtonModifiers.Text> {
        self.modifier(mod: ButtonModifiers.Text(value: value))
    }
    
    func actionType(_ value: ActionType) -> Next<ButtonModifiers.Action> {
        self.modifier(mod: ButtonModifiers.Action(value: value))
    }
}

public struct Button {
    
    public struct Role: Equatable {
        let name: String
        public init(_ name: String) {
            self.name = name
        }
    }
    
    let name: Button.Role
    
    public init(_ name: Role) {
        self.name = name
    }
    
//    @discardableResult public func position(_ value: CGPoint) -> Self {
//        var result = self
//        result.position = value
//        return result
//    }
    
//    @discardableResult public func size(_ value: CGSize) -> Self {
//        var result = self
//        result.size = value
//        return result
//    }
    
//    @discardableResult public func color(_ value: SKColor) -> Self {
//        var result = self
//        result.color = value
//        return result
//    }
    
//    @discardableResult public func text(_ value: String) -> Self {
//        var result = self
//        result.text = value
//        return result
//    }
//
//    @discardableResult public func actionType(_ value: ActionType) -> Self {
//        var result = self
//        result.actionType = value
//        return result
//    }
    
}

extension Button: Widget {
    public typealias Context = ButtonContext
    
    public func node(context: ButtonContext) -> SKNode {
        let result = SKNode()
        
        let label = SKLabelNode(text: context.text ?? "\(self.name)")
        label.verticalAlignmentMode = .center
        label.zPosition = -1
        
        let sensor = ButtonSensor(color: context.color, size: label.frame.size)
        sensor.size.width += 10
        sensor.alpha = 0.01
        sensor.roleName = self.name
        sensor.setAction(type: context.actionType)
        
        result.addChild(sensor)
        result.addChild(label)
        result.position = context.position
        return result
    }
    
}
