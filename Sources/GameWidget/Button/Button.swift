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
