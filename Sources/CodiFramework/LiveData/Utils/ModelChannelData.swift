//
//  ModelChannelData.swift
//  Codi
//
//  Created by Charles Romeo on 12/21/23.
//

import Foundation
import SwiftUI

public class WindowController {
    var windowId: String = ""
    var stateAction: String = "open" //close
    var viewId: String = ""
    
    public init(windowId: String, stateAction: String, viewId: String="") {
        self.windowId = windowId
        self.stateAction = stateAction
        self.viewId = viewId
    }
}

public class ViewAtts {
    var viewId: String = ""
    var size: Double? = nil
    var rotation: Double? = nil
    var color: Color? = nil
    var level: Int = 0
    var isLocked: Bool = false
    var isDeleted: Bool = false
    var stateAction: String = "open" //close
    
    public init(
        viewId: String,
        size: Double? = nil,
        rotation: Double? = nil,
        color: Color? = nil,
        level:Int=0,
        isDeleted: Bool = false,
        stateAction: String="open"
    ){
        self.viewId = viewId
        self.size = size
        self.rotation = rotation
        self.color = color
        self.level = level
        self.isDeleted = isDeleted
        self.stateAction = stateAction
    }
}

public class ViewMenu {
    var viewId: String = ""
    var state: String = "close" // "open"
    
    public init(viewId: String, state: String) {
        self.viewId = viewId
        self.state = state
    }
}

public class SessionChange {
    var sessionId: String? = nil
    var activityId: String? = nil
    
    public init(sessionId: String?=nil, activityId: String?=nil) {
        self.sessionId = sessionId
        self.activityId = activityId
    }
}

public class ViewFollowing {
    var viewId: String = ""
    var x: Double = 0.0
    var y: Double = 0.0
    var hasDropped = false
    
    public init(viewId: String, x:Double=0.0, y:Double=0.0, hasDropped:Bool=false) {
        self.viewId = viewId
        self.x = x
        self.y = y
        self.hasDropped = true
    }
    
    public func getPoint() -> CGPoint {
        return CGPoint(x: self.x, y: self.y)
    }
}
