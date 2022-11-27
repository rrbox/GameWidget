//
//  ButtonTests.swift
//  
//
//  Created by rrbox on 2022/11/28.
//

import XCTest
import GameWidget

final class ButtonTests: XCTestCase {
    func testModifiers() {
        let button = Button(.init("test"))
            .modifiable
            .color(.black)
            .position(CGPoint(x: 1, y: 1))
            .text("test_2")
            .zPosition(1)
            .actionType(.alpha)
            .node()
        
        XCTAssertEqual(button.position, CGPoint(x: 1, y: 1))
        XCTAssertEqual(button.zPosition, 1)
    }
}
