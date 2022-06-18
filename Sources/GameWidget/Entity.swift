//
//  File.swift
//  
//
//  Created by rrbox on 2022/06/18.
//

import GameplayKit

final private class UserInterfaceBaseNode: GKSKNodeComponent {}

final public class UserInterfaceDisplay: GKSKNodeComponent {
    
    init(_ display: Display) {
        super.init(node: display.node())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func didAddToEntity() {
        self.entity?.component(ofType: UserInterfaceBaseNode.self)?.node.addChild(self.node)
    }
    
    deinit {
        self.node.removeFromParent()
    }
    
}

public func makeUserInterfaceEntity(camera: SKNode, display: Display) -> GKEntity {
    let result = GKEntity()
    result.addComponent(UserInterfaceBaseNode(node: camera))
    result.addComponent(UserInterfaceDisplay(display))
    return result
}
