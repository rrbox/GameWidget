//
//  ButtonModifiers.swift
//  
//
//  Created by rrbox on 2022/11/15.
//

import SpriteKit

public struct ButtonContext: ContextProtocol, PositionContextProtocol, ColorizableContextProtocol {
    public init() {}
    
    public var color = SKColor.white
    public var position = CGPoint.zero
    var text: String?
    var actionType = ActionType.scale
}

public enum ButtonModifiers {
//    public struct Color: Modifier {
//        public typealias Context = ButtonContext
//        var value: SKColor
//        
//        public func mod(context: inout ButtonContext) {
//            context.color = self.value
//        }
//    }
    
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
//    func color(_ value: SKColor) -> Next<ButtonModifiers.Color> {
//        self.modifier(mod: ButtonModifiers.Color(value: value))
//    }
    
    func text(_ value: String?) -> Next<ButtonModifiers.Text> {
        self.modifier(mod: ButtonModifiers.Text(value: value))
    }
    
    func actionType(_ value: ActionType) -> Next<ButtonModifiers.Action> {
        self.modifier(mod: ButtonModifiers.Action(value: value))
    }
}
