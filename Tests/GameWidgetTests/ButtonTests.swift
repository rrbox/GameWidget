//
//  ButtonTests.swift
//  
//
//  Created by rrbox on 2022/11/28.
//

import XCTest
import GameWidget
import SpriteKit

final class ButtonTests: XCTestCase {
    func testModifiers() {
        let button = Button(.init("test"))
            .modifiable
            .color(.green)
            .position(CGPoint(x: 1, y: 1))
            .text("test_2")
            .zPosition(1)
            .actionType(.alpha)
            .createModels().0
        
        
        
        XCTAssertEqual(button.position, CGPoint(x: 1, y: 1))
        XCTAssertEqual(button.zPosition, 1)
        
        guard let sensor = button.children[0] as? SKSpriteNode,
              let label = button.children[1] as? SKLabelNode else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(sensor.color.cgColor.components, SKColor.green.cgColor.components)
        XCTAssertEqual(label.text, "test_2")
    }
}
