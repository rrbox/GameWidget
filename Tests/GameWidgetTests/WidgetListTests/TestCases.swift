//
//  TestCases.swift
//  
//
//  Created by rrbox on 2023/02/12.
//

import XCTest
import GameWidget

class NotificationShareTests: XCTestCase {
    func testCreateList() {
        
    }
    
    // 実行経路のチェックが必要な項目
    // - シンプルな Widget の node() と createModels()
    // - モディファイア付き Widget の node() と createModels()
    // - DataOutputPlugIn な Widget の node() と createModels()
    // - DataOutputPlugIn な Widget から生成された ModifiableWidget の node() と createModels()
    
    func testCase_0() {
        let (node, center) = WidgetCase_0().createModels()
    }
    
    func testCase_1() {
        let (node, center) = WidgetCase_1()
            .modifiable
            .text("test_1")
            .createModels()
    }
    
    func testCase_2() {
        let (node, notificationCenter) = WidgetCase_2(id: "test_2")
            .modifiable
            .text("test") // modifier
            .text("test")
            .createModels()
    }
    
    func setWidget(_ widget: some Widget) {
        
    }
    
    func testDisplay() {
        let (node, center) = Display()
            .place {
                WidgetCase_2(id: "test_display_0")
                WidgetCase_2(id: "test_display_1")
                WidgetCase_2(id: "test_display_2")
                
                Display()
                    .place {
                        WidgetCase_2(id: "test_display_0")
                        WidgetCase_2(id: "test_display_1")
                        WidgetCase_2(id: "test_display_2")
                    }
            }
            .createModels()
        
    }
    
}
