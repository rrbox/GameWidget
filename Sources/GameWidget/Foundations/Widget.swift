//
//  Widget.swift
//  GameWidget
//
//  Created by rrbox on 2022/03/10.
//


import SpriteKit

public protocol ContextProtocol {
    init()
}

extension Never: ContextProtocol {
    public init() {
        fatalError()
    }
}

public protocol Modifier {
    associatedtype Context: ContextProtocol
    func mod(context: inout Context)
}

public protocol ContextBuilder {
    associatedtype Mod: Modifier
    
    var modData: Mod { get set }
    func mod(context: inout Mod.Context)
}

public struct Link<Previous: ContextBuilder, Mod: Modifier>: ContextBuilder where Previous.Mod.Context == Mod.Context {
    var previous: Previous
    public var modData: Mod
    
    public func mod(context: inout Mod.Context) {
        self.previous.mod(context: &context)
        self.modData.mod(context: &context)
    }
    
}

public struct SingleModifieredBuilder<T: Modifier>: ContextBuilder {
    public var modData: T
    
    public func mod(context: inout T.Context) {
        self.modData.mod(context: &context)
    }
    
    func modifiered<T: Modifier>(mod: T) -> Next<T> {
        .init(previous: self, modData: mod)
    }
}

public extension ContextBuilder {
    typealias Next<T: Modifier> = Link<Self, T> where T.Context == Self.Mod.Context
    
    func context() -> Mod.Context {
        var result = Mod.Context()
        self.mod(context: &result)
        return result
    }
    
    func modifiered<T: Modifier>(mod: T) -> Next<T> {
        .init(previous: self, modData: mod)
    }
}

public protocol Widget {
    func node(context: Context) -> SKNode
    func node() -> SKNode
    func addTo(parent list: inout [SKNode])
    
    associatedtype Context: ContextProtocol
    
}

public extension Widget {
    func addTo(parent list: inout [SKNode]) {
        list.append(self.node())
    }
    
    func node() -> SKNode {
        self.node(context: Context())
    }
}

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
    
    // Widget.modifier<T>(mod)(下記)に吸われてしまい, 実行されない... -> ModifieredWidget が body に入ってしまう -> node(context) が実行されてエラーになる.
    // SKNodeBuilder 同様に empty を作って初期のモディファイアにした方がいいかも.
    // 願望としては, 起点とモディファイアを分離したい.
    // -> rx の API を参考にし, modifiable プロパティでモディファイア追加可能になるようにした.
    func modifier<T: Modifier>(mod: T) -> Next<T> {
        .init(body: self.body, builder: self.builder.modifiered(mod: mod))
    }
}

public struct Empty<Context: ContextProtocol>: Modifier {
    public func mod(context: inout Context) {
        
    }
    
}

public extension Widget {
    typealias Modifiable = ModifiableWidget<Self, SingleModifieredBuilder<Empty<Context>>>
    
//    func modifier<T: Modifier>(mod: T) -> Next<T> {
//        .init(body: self, builder: SingleModifieredBuilder(modData: mod))
//    }
    
    var modifiable: Modifiable {
        .init(body: self, builder: SingleModifieredBuilder(modData: Empty()))
    }
}
