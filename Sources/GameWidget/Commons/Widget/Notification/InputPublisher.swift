//
//  InputPublisher.swift
//  
//
//  Created by rrbox on 2023/02/19.
//

import SpriteKit

public protocol NotificationPublisher {
    var notificationSystem: WidgetNotificationSystem? { get set }
}

public protocol PublisherNode: SKNode {
    var notificationSystem: WidgetNotificationSystem? { get set }
}
