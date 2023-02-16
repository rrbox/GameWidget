//
//  Widget+PlugIns.swift
//  
//
//  Created by rrbox on 2023/02/16.
//

public extension NodeGenerator where Self: ContextPresentPlugIn, Context: ParameterLessGeneratable {
    func node() -> Node {
        self.node(applying: Context())
    }
}
