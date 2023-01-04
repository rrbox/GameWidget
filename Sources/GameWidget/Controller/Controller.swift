//
//  File.swift
//  
//
//  Created by rrbox on 2022/08/30.
//

import GameplayKit
import Combine

public enum ControllerData {
    public struct Direction: OptionSet {
        public var rawValue: UInt8
        public init(rawValue: UInt8) {
            self.rawValue = rawValue
        }
        
        public static let up = Direction(rawValue: 0b0001)
        public static let right = Direction(rawValue: 0b0010)
        public static let down = Direction(rawValue: 0b0100)
        public static let left = Direction(rawValue: 0b1000)
    }
    
    public struct Input {
        public var weight: CGFloat
        public var direction: Direction
    }
    
    public struct Name: Hashable {
        let name: String
        public init(_ name: String) {
            self.name = name
        }
    }
    
    public static var inputs = CurrentValueSubject<[Name: Input], Never>([Name: Input]())
    
}

/// クリックするとコントローラーが表示される領域
class ControllerAreaNode: SKSpriteNode {
    let origin = SKShapeNode(circleOfRadius: 32)
    let cursor = SKShapeNode(circleOfRadius: 20)
    
    var id: ControllerData.Name!
    
    // 原点からの距離を計算
    func distanceOf(_ v: CGPoint) -> CGFloat {
        sqrt(pow(v.x, 2)+pow(v.y, 2))
    }
    
    override var isUserInteractionEnabled: Bool {
        get { true }
        set {}
    }
    
    override func mouseDown(with event: NSEvent) {
        self.origin.position = event.location(in: self)
        self.cursor.position = .zero
        self.addChild(self.origin)
    }
    
    override func mouseDragged(with event: NSEvent) {
        let mouse = event.location(in: self.origin)
        let d = distanceOf(mouse)
        let restriction = CGPoint(x: (mouse.x/d)*32, y: (mouse.y/d)*32)
        if d < 32 {
            self.cursor.position = mouse
        } else {
            self.cursor.position = restriction
        }
        
        var resultDirection: ControllerData.Direction = []
        
        if mouse.y > abs(2*mouse.x) {
            resultDirection = .up
        } else if mouse.x > abs(2*mouse.y) {
            resultDirection = .right
        } else if mouse.y < -abs(2*mouse.x) {
            resultDirection = .down
        } else if mouse.x < -abs(2*mouse.y) {
            resultDirection = .left
        } else if mouse.x > 0 && mouse.y > 0 {
            resultDirection = [.up, .right]
        } else if mouse.x > 0 && mouse.y < 0 {
            resultDirection = [.right, .down]
        } else if mouse.x < 0 && mouse.y < 0 {
            resultDirection = [.down, .left]
        } else if mouse.x < 0 && mouse.y > 0 {
            resultDirection = [.left, .up]
        }
        
        ControllerData.inputs.value[self.id] = ControllerData.Input(weight: d, direction: resultDirection)
    }
    
    override func mouseUp(with event: NSEvent) {
        self.origin.removeFromParent()
        ControllerData.inputs.value[self.id]? = ControllerData.Input(weight: 0, direction: [])
    }
    
}

public struct ControllerArea: Widget, ContextPresenter {
    public typealias Context = ControllerContext
    
    var id: ControllerData.Name
    
    public init(_ id: ControllerData.Name) {
        self.id = id
    }
    
    public func node(context: ControllerContext) -> SKNode {
        let result = ControllerAreaNode(color: .black, size: context.size)
        result.id = self.id
        ControllerData.inputs.value[self.id] = ControllerData.Input(weight: 0, direction: [])
        result.color = SKColor(red: 1, green: 1, blue: 1, alpha: 0.01)
        result.origin.addChild(result.cursor)
        result.position = context.position
        return result
    }
    
}
