//
//  TextVisible.swift
//  
//
//  Created by rrbox on 2022/11/28.
//

public protocol TextContextProtocol: ContextProtocol {
    var text: String { get set }
}

public struct Text<Context: TextContextProtocol>: Modifier {
    var value: String
    public func mod(context: inout Context) {
        context.text = self.value
    }
}

public extension ModifiableWidget where Context: TextContextProtocol {
    func text(_ value: String) -> Next<Text<Context>> {
        self.modifier(mod: Text(value: value))
    }
}
