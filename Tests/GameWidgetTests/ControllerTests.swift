//
//  ControllerTests.swift
//  
//
//  Created by rrbox on 2022/11/28.
//

import XCTest
import GameWidget
import SpriteKit

final class ControllerTests: XCTestCase {
    func testModifiers() {
        let controller = ControllerArea(.init("test"))
            .modifiable
            .position(CGPoint(x: 1, y: 1))
            .size(CGSize(width: 32, height: 32))
            .node()
        
        guard let controller = controller as? SKSpriteNode else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(controller.position, CGPoint(x: 1, y: 1))
        XCTAssertEqual(controller.size, CGSize(width: 32, height: 32))
        
    }
}
