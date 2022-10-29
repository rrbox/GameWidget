//
//  LinkedModifier.swift
//  
//
//  Created by rrbox on 2022/10/29.
//

public struct ModifierLink<Previous: ContextBuilder, Mod: Modifier>: ContextBuilder where Previous.Mod.Context == Mod.Context {
    var previous: Previous
    public var modData: Mod
    
    public func mod(context: inout Mod.Context) {
        self.previous.mod(context: &context)
        self.modData.mod(context: &context)
    }
    
}

public extension ContextBuilder {
    typealias Next<T: Modifier> = ModifierLink<Self, T> where T.Context == Self.Mod.Context
    
    func modifiered<T: Modifier>(mod: T) -> Next<T> {
        .init(previous: self, modData: mod)
    }
}
