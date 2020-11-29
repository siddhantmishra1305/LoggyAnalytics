//
//  LogReportController.swift
//  LoggyAnalytics
//
//  Created by Siddhant Mishra on 22/11/20.
//

import Cocoa

class LogReportController: NSTabViewController, NSWindowDelegate {
    
    private lazy var tabViewSizes: [NSTabViewItem: NSSize] = [:]
    
     var  detailArr = [LogRecord]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear() {
        
        let dashboardIndex = self.tabView.indexOfTabViewItem(withIdentifier: "dashboard")
        let dashboardTVItem:NSTabViewItem = self.tabViewItems[dashboardIndex] as NSTabViewItem
        let dashboardVC:Dashboard? = dashboardTVItem.viewController as! Dashboard?
        if (dashboardVC != nil){
            dashboardVC!.detailArr = detailArr
            
        }
        
        let logDetailsIndex = self.tabView.indexOfTabViewItem(withIdentifier: "logDetails")
        let logDetailsTVItem:NSTabViewItem = self.tabViewItems[logDetailsIndex] as NSTabViewItem
        let logDetailsVC:ReportDetail? = logDetailsTVItem.viewController as! ReportDetail?
        if(logDetailsVC != nil) {
            logDetailsVC!.detailArr = detailArr
        }
        
        self.view.window?.setFrame(NSRect(x: 0, y: 0, width:700 , height: 500), display: false, animate: true)
        
    }
    
    override func tabView(_ tabView: NSTabView, didSelect tabViewItem: NSTabViewItem?) {
        super.tabView(tabView, didSelect: tabViewItem)
        
        if let tabViewItem = tabViewItem {
            view.window?.title = tabViewItem.label
            resizeWindowToFit(tabViewItem: tabViewItem)
        }
    }
    
    override func tabView(_ tabView: NSTabView, willSelect tabViewItem: NSTabViewItem?) {
        super.tabView(tabView, willSelect: tabViewItem)
        
        if let tabViewItem = tabViewItem, let size = tabViewItem.view?.frame.size, !tabViewSizes.keys.contains(tabViewItem) {
            tabViewSizes[tabViewItem] = size
        }
        
        if tabViewItem?.identifier as! String != "NSTabViewDatabaseItem" {
            self.view.window?.styleMask.remove( [ .resizable ] )
        } else {
            self.view.window?.styleMask.insert( [ .resizable ] )
        }
    }
    
    
    private func resizeWindowToFit(tabViewItem: NSTabViewItem) {
        
        guard let size = tabViewSizes[tabViewItem], let window = view.window else {
            return
        }
        
        let contentRect = NSRect(x: 0, y: 0, width: size.width, height: size.height)
        let contentFrame = window.frameRect(forContentRect: contentRect)
        let toolbarHeight = window.frame.size.height - contentFrame.size.height
        let newOrigin = NSPoint(x: window.frame.origin.x, y: window.frame.origin.y + toolbarHeight)
        let newFrame = NSRect(origin: newOrigin, size: contentFrame.size)
        window.setFrame(newFrame, display: false, animate: true)
    }
}

