//
//  HStack.swift
//  
//
//  Created by rrbox on 2023/04/21.
//

import SpriteKit

public struct HStack<T: WidgetTupleProtocol>: WidgetListElementType, SplittingFrameElementType {
    let widgetTuple: T
    
    public init(@WidgetTupleBuilder _ builder: () -> T) {
        self.widgetTuple = builder()
    }
    
    public func addTo(buffer: inout [SKNode], frame: WidgetFrame, center: WidgetNotificationSystem) {
        let size = CGSize(width: frame.size.width/CGFloat(self.widgetTuple.countOfNodes), height: frame.size.height)
        var position = CGPoint(x: frame.position.x + (-frame.size.width/2) + (size.width/2), y: frame.position.y)// 左端四角形の中心の座標
        
        let frames = (0...self.widgetTuple.countOfNodes-1).reduce(into: [WidgetFrame]()) { partialResult, i in
            partialResult.append(WidgetFrame(position: position, padding: frame.padding, size: size))
            position.x += size.width
        }
        
        self.widgetTuple.addTo(buffer: &buffer, frames: frames, center: center)
    }
    
}
