//
//  File.swift
//  
//
//  Created by rrbox on 2022/08/30.
//

import GameplayKit

class ControllerCenter: SKShapeNode {

    weak var directionNode: SKShapeNode?
    
    // 原点からの距離を計算
    func distanceOf(_ v: CGPoint) -> CGFloat {
        sqrt(pow(v.x, 2)+pow(v.y, 2))
    }
    
    override func mouseDragged(with event: NSEvent) {
        let mouse = event.location(in: self)
        let d = distanceOf(mouse)
        let restriction = CGPoint(x: (mouse.x/d)*32, y: (mouse.y/d)*32)
        if d < 32 {
            self.directionNode?.position = mouse
        } else {
            self.directionNode?.position = restriction
        }
    }
}

/// クリックするとコントローラーが表示される領域
class ControllerAreaNode: SKSpriteNode {
    let centerNode = ControllerCenter(circleOfRadius: 32)
    let directionNode = SKShapeNode(circleOfRadius: 10)
    
    override var isUserInteractionEnabled: Bool {
        get { true }
        set {}
    }
    
    override func mouseDown(with event: NSEvent) {
        self.centerNode.position = event.location(in: self)
        self.directionNode.position = .zero
        self.addChild(self.centerNode)
    }
    
    override func mouseDragged(with event: NSEvent) {
        self.centerNode.mouseDragged(with: event)
    }
    
    override func mouseUp(with event: NSEvent) {
        self.centerNode.removeFromParent()
    }
    
}

public struct ControllerArea: Widget, MoveableItem {
    var size: CGSize = CGSize(width: 100, height: 100)
    public var position: CGPoint = .zero
    
    public init() {}
    
    public func node() -> SKNode {
        let result = ControllerAreaNode(color: .black, size: self.size)
        result.color = SKColor(red: 1, green: 1, blue: 1, alpha: 0.01)
        result.addChild(SKSpriteNode(color: .blue, size: CGSize(width: 100, height: 100)))
        result.centerNode.directionNode = result.directionNode
        result.centerNode.addChild(result.directionNode)
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
