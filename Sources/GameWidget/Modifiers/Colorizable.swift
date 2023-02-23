//
//  Colorizable.swift
//  
//
//  Created by rrbox on 2022/11/28.
//

import SpriteKit

public protocol ColorizableContextProtocol: ContextProtocol {
    var color: SKColor { get set }
}

public struct Color<Context: ColorizableContextProtocol>: Modifier {
    var value: SKColor
    public func mod(context: inout Context) {
        context.color = self.value
    }
}

public extension ModifiableWidget where Context: ColorizableContextProtocol {
    func color(_ value: SKColor) -> Next<Color<Context>> {
        self.modifier(mod: Color(value: value))
    }
}
