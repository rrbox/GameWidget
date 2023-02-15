//
//  WidgetPlugins.swift
//  
//
//  Created by rrbox on 2023/02/15.
//

import SpriteKit

// plugins

/// Context をノードに反映する protocol です.
///
/// Widget に適用するとモディファイアが使えるようになります.
public protocol ContextPresentPlugIn {
    associatedtype Context: WidgetContextType
    associatedtype Node: SKNode
    func node(context: Context) -> Node
}

/// UI パーツをコントロールするモデルを生成する protocol です.
///
/// Widget に組み込むことができます.
//public protocol WidgetModelGenerator: ModelGenerator {
//    /// ノードと、それを制御できる NotificationCenter のペアを出力します.
//
//}

/// `NotificationCenter` で外部からコントロール可能なノードを生成する protocol です.
///
/// Widget に組み込むことができます.
public protocol DataOutputPlugIn: NodeGenerator where Node: ObserveableNode {
    var id: Node.Identifier { get }
}

