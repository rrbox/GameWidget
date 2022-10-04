//
//  File.swift
//  
//
//  Created by rrbox on 2022/08/30.
//

import GameplayKit

/// クリックするとコントローラーが表示される領域
class ControllerAreaNode: SKSpriteNode {
    override var isUserInteractionEnabled: Bool {
        get { true }
        set {}
    }
    
    override func mouseDown(with event: NSEvent) {
        
    }
    override func mouseDragged(with event: NSEvent) {
        
    }
    override func mouseUp(with event: NSEvent) {
        
    }
    
}

struct ControllerArea: Widget {
    var size: CGSize
    func node() -> SKNode {
        let result = ControllerAreaNode(color: .black, size: self.size)
        result.alpha = 0.01
        return result
    }
}
