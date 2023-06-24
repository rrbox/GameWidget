//
//  VStack.swift
//  
//
//  Created by rrbox on 2023/04/21.
//

import SpriteKit

public struct VStack<T: WidgetTupleProtocol>: WidgetListElementType, SplittingFrameElementType {
    let widgetTuple: T
    
    public init(@WidgetTupleBuilder _ builder: () -> T) {
        self.widgetTuple = builder()
    }
    
    public func addTo(buffer: inout [SKNode], frame: WidgetFrame, center: WidgetNotificationSystem) {
        // 等分されたサイズ
        let size = CGSize(width: frame.size.width, height: frame.size.height/CGFloat(self.widgetTuple.countOfNodes))
        
        // 四角形の左端頂点の座標
        var position = CGPoint(x: frame.position.x, y: frame.position.y + (frame.size.height/2) - (size.height/2))
        
        let frames = (0...self.widgetTuple.countOfNodes-1).reduce(into: [WidgetFrame]()) { partialResult, i in
            partialResult.append(WidgetFrame(position: position, padding: frame.padding, size: size))
            position.y -= size.height
        }
        
        self.widgetTuple.addTo(buffer: &buffer, frames: frames, center: center)
    }
    
}
