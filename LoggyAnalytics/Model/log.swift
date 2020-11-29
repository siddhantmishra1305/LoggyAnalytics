//
//  log.swift
//  LoggyAnalytics
//
//  Created by Siddhant Mishra on 22/11/20.
//

import Foundation

class LogRecord : NSObject{
    @objc dynamic var id : Int = 0
    @objc dynamic var fileName : String
    @objc dynamic var functionName : String
    @objc dynamic var lineNum : String
    @objc dynamic var type : String
    @objc dynamic var timeStamp : String
    @objc dynamic var desc : String
    
    init(filename:String,funcName:String, line:String, type:String, timeStamp:String, desc:String) {
        self.fileName = filename
        self.functionName = funcName
        self.lineNum = line
        self.type = type
        self.timeStamp = timeStamp
        self.desc = desc
    }
}
