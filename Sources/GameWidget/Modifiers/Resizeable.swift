//
//  Resieable.swift
//  
//
//  Created by rrbox on 2022/11/28.
//

import CoreGraphics

public protocol ResizeableContextProtocol: ContextProtocol {
    var size: CGSize { get set }
}

public struct Size<Context: ResizeableContextProtocol>: Modifier {
    var value: CGSize
    public func mod(context: inout Context) {
        context.size = self.value
    }
}

public extension ModifiableWidget where Context: ResizeableContextProtocol {
    func size(_ value: CGSize) -> Next<Size<Context>> {
        self.modifier(mod: Size(value: value))
    }
}
