//
//  Dashboard.swift
//  LoggyAnalytics
//
//  Created by Siddhant Mishra on 22/11/20.
//

import Cocoa

class Dashboard: NSViewController, NSWindowDelegate {
    
    @IBOutlet weak var pieChart: NSView!
//    @IBOutlet weak var barChart: NSView!
    @IBOutlet weak var lineErrorChart: NSView!
//    @IBOutlet weak var lineWarningChar: NSView!
    
    @IBOutlet weak var graphContainerView: NSView!
    var  detailArr = [LogRecord]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear() {

        self.view.layer?.backgroundColor = Constants.backgroundColor?.cgColor
        self.pieChart.layer?.backgroundColor = Constants.backgroundColor?.cgColor
        self.lineErrorChart.layer?.backgroundColor = Constants.backgroundColor?.cgColor
        self.graphContainerView.layer?.backgroundColor = Constants.backgroundColor?.cgColor
        
        let chartframes = NSRect(x: 0, y: 0, width: 725.0, height: 240.0)
        
        let pieVie = PieChart(frame: chartframes)
        pieVie.detailArr = detailArr
        
        let barView = BarChart(frame: chartframes)
        barView.detailArr = detailArr
        
       
        pieChart.addSubview(pieVie)
//        barChart.addSubview(barView)
        lineErrorChart.addSubview(barView)
//        lineWarningChar.addSubview(lineWarningView)

    }
    
}
