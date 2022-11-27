//
//  ButtonModifiers.swift
//  
//
//  Created by rrbox on 2022/11/15.
//

import SpriteKit

public struct ButtonContext: ContextProtocol,
                             PositionContextProtocol,
                             ColorizableContextProtocol,
                             TextContextProtocol {
    public init() {}
    
    public var color = SKColor.white
    public var position = CGPoint.zero
    public var text: String?
    var actionType = ActionType.scale
}

public enum ButtonModifiers {
    
    public struct Action: Modifier {
        public typealias Context = ButtonContext
        var value: ActionType
        
        public func mod(context: inout ButtonContext) {
            context.actionType = self.value
        }
    }

}

public extension ModifiableWidget where Context == ButtonContext {
    func actionType(_ value: ActionType) -> Next<ButtonModifiers.Action> {
        self.modifier(mod: ButtonModifiers.Action(value: value))
    }
}
