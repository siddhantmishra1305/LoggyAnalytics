//
//  ReportDetail.swift
//  LoggyAnalytics
//
//  Created by Siddhant Mishra on 22/11/20.
//

import Cocoa

class ReportDetail: NSViewController, NSWindowDelegate {
    
    @IBOutlet weak var detailTableView: NSTableView!
    
    @objc dynamic var detailArr = [LogRecord]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTableView.backgroundColor = Constants.backgroundColor!
        detailTableView.intercellSpacing = NSSize(width: 0, height: 30)
    }
    
    
    
}
