//
//  BarChartTests.swift
//  
//
//  Created by rrbox on 2022/11/28.
//

import XCTest
import GameWidget
import SpriteKit

final class BarChartTests: XCTestCase {
    func testModifiers() {
        let barChart = HorizontalSingleBarChart(name: .init("test"))
            .modifiable
            .position(CGPoint(x: 1, y: 1))
            .color(.red)
            .width(90)
            .length(90)
            .alignment(.center)
            .backgroundColor(.blue)
            .node()
        
        guard let barChart = barChart as? SKSpriteNode,
              let bar = barChart.children[0] as? SKSpriteNode else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(barChart.position, CGPoint(x: 1, y: 1))
        XCTAssertEqual(barChart.color.cgColor.components, SKColor.blue.cgColor.components)
        XCTAssertEqual(barChart.size, CGSize(width: 90, height: 90))
        
        XCTAssertEqual(bar.color.cgColor.components, SKColor.red.cgColor.components)
        XCTAssertEqual(bar.size, CGSize(width: 90, height: 90))
        XCTAssertEqual(bar.anchorPoint, CGPoint(x: 0.5, y: 0.5))
        
    }
}
