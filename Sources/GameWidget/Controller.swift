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
    let cursor = SKShapeNode(circleOfRadius: 10)
    
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
        self.origin.mouseDragged(with: event)
    }
    
    override func mouseUp(with event: NSEvent) {
        self.origin.removeFromParent()
    }
    
}

public struct ControllerArea: Widget, MoveableItem {
    var size: CGSize = CGSize(width: 100, height: 100)
    public var position: CGPoint = .zero
    
    public init() {}
    
    public func node() -> SKNode {
        let result = ControllerAreaNode(color: .black, size: self.size)
        result.color = SKColor(red: 1, green: 1, blue: 1, alpha: 0.01)
        result.origin.addChild(result.cursor)
        result.position = self.position
        return result
    }
    
}

public extension ControllerArea {
    func size(_ value: CGSize) -> Self {
        var result = self
        result.size = value
        return result
    }
    
}
