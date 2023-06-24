//
//  Frame.swift
//  
//
//  Created by rrbox on 2022/11/28.
//

import CoreGraphics

public struct Position<Context: ContextProtocol>: Modifier {
    var value: CGPoint
    
    public init(value: CGPoint) {
        self.value = value
    }
    
    public func mod(context: inout Context) {
        context.position = self.value
    }
    
}

public struct Size<Context: ContextProtocol>: Modifier {
    var value: CGSize
    public func mod(context: inout Context) {
        context.size = self.value
    }
}

public extension ModifiableWidget where Context: ContextProtocol {
    func size(_ value: CGSize) -> Next<Size<Context>> {
        self.modifier(mod: Size(value: value))
    }
}

public struct Padding<Context: ContextProtocol>: Modifier {
    var value: CGSize
    public func mod(context: inout Context) {
        context.size
    }
}
