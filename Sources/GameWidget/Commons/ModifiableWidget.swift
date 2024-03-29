//
//  ModifiableWidget.swift
//  
//
//  Created by rrbox on 2022/10/29.
//

import SpriteKit

public struct ModifiableWidget<Body: Widget, Builder: ContextBuilder>: Widget where Body.Context == Builder.Mod.Context {
    public func node(context: Body.Context) -> SKNode {
        fatalError("\(context)")
    }
    
    public func node() -> SKNode {
        var context = Context()
        self.builder.mod(context: &context)
        return body.node(context: context)
    }
    
    public typealias Context = Body.Context
    public typealias Next<T: Modifier> = ModifiableWidget<Body, Builder.Next<T>> where T.Context == Body.Context
    
    var body: Body
    var builder: Builder
    
    public func modifier<T: Modifier>(mod: T) -> Next<T> {
        .init(body: self.body, builder: self.builder.modifiered(mod: mod))
    }
}

public struct Empty<Context: ContextProtocol>: Modifier {
    public func mod(context: inout Context) {
        
    }
    
}

public extension Widget {
    typealias Modifiable = ModifiableWidget<Self, SingleModifierBuilder<Empty<Context>>>
    
    var modifiable: Modifiable {
        .init(body: self, builder: SingleModifierBuilder(modData: Empty()))
    }
}
