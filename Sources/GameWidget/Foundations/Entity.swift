//
//  File.swift
//  
//
//  Created by rrbox on 2022/06/18.
//

import GameplayKit

final private class UserInterfaceBaseNode: GKSKNodeComponent {}

final public class UserInterfaceDisplay<T: Widget>: GKSKNodeComponent {
    
    init(_ display: T) {
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

public func makeUserInterfaceEntity<T: Widget>(camera: SKNode, display: T) -> GKEntity {
    let result = GKEntity()
    result.addComponent(UserInterfaceBaseNode(node: camera))
    result.addComponent(UserInterfaceDisplay(display))
    return result
}
