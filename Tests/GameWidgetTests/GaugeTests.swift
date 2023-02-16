//
//  BarChartTests.swift
//  
//
//  Created by rrbox on 2022/11/28.
//

import XCTest
import GameWidget
import SpriteKit

final class GaugeTests: XCTestCase {
    func testModifiers() {
        let gauge = Gauge(name: .init("test"))
            .modifiable
            .position(CGPoint(x: 1, y: 1))
            .color(.red)
            .width(90)
            .length(90)
            .alignment(.center)
            .backgroundColor(.blue)
            .alpha(0.5)
            .zPosition(2)
            .node()
        
        guard let gauge = gauge as? SKSpriteNode,
              let background = gauge.children[0] as? SKSpriteNode else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(gauge.position, CGPoint(x: 1, y: 1))
        XCTAssertEqual(gauge.color.cgColor.components, SKColor.red.cgColor.components)
        XCTAssertEqual(gauge.size, CGSize(width: 90, height: 90))
        XCTAssertEqual(gauge.alpha, 0.5)
        XCTAssertEqual(gauge.zPosition, 2)
        
        XCTAssertEqual(background.color.cgColor.components, SKColor.blue.cgColor.components)
        XCTAssertEqual(background.size, CGSize(width: 90, height: 90))
        XCTAssertEqual(background.anchorPoint, CGPoint(x: 0.5, y: 0.5))
        XCTAssertEqual(CGFloat(Int(background.zPosition*100))/100, 2 - 0.01)
        
    }
}
