//
//  Button.swift
//  GameWidget
//
//  Created by rrbox on 2022/03/10.
//

import SpriteKit
import GameplayKit

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
    
}

extension Button: Widget, ContextPresentPlugIn, UserInputPlugIn {
    
    public typealias Context = ButtonContext
    
    public func node(applying context: ButtonContext) -> ButtonNode {
        let result = ButtonNode()
        
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
        result.zPosition = context.zPosition
        return result
    }
    
}
