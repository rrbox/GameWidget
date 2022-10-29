//
//  Context.swift
//  
//
//  Created by rrbox on 2022/10/29.
//

public protocol ContextProtocol {
    init()
}

extension Never: ContextProtocol {
    public init() {
        fatalError()
    }
}
