//
//  File.swift
//  
//
//  Created by rrbox on 2022/08/30.
//

import GameplayKit

class ControllerOrigin: SKShapeNode {

    weak var cursor: SKShapeNode?
    
    // 原点からの距離を計算
    func distanceOf(_ v: CGPoint) -> CGFloat {
        sqrt(pow(v.x, 2)+pow(v.y, 2))
    }
    
    override func mouseDragged(with event: NSEvent) {
        let mouse = event.location(in: self)
        let d = distanceOf(mouse)
        let restriction = CGPoint(x: (mouse.x/d)*32, y: (mouse.y/d)*32)
        if d < 32 {
            self.cursor?.position = mouse
        } else {
            self.cursor?.position = restriction
        }
    }
}

/// クリックするとコントローラーが表示される領域
class ControllerAreaNode: SKSpriteNode {
    let origin = ControllerOrigin(circleOfRadius: 32)
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
        result.origin.cursor = result.cursor
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
