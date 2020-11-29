//
//  BarChart.swift
//  LoggyAnalytics
//
//  Created by Siddhant Mishra on 23/11/20.
//

import Cocoa
import Charts

class BarChart: NSView, NibLoadable {
    @IBOutlet weak var barView: BarChartView!
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        Bundle.main.loadNibNamed("BarChart", owner: self, topLevelObjects: nil)
        let contentFrame = NSMakeRect(0, 0, self.frame.size.width, self.frame.size.height)
        self.barView.frame = contentFrame
        self.barView.layer?.backgroundColor = Constants.backgroundColor?.cgColor
        self.addSubview(self.barView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var detailArr:[LogRecord]?{
        didSet{
            if detailArr?.count ?? 0 > 0{
                var barData = BarChartData()
                let arrCount = Double(detailArr!.count)
                
                let errorCount = Double(detailArr?.filter{$0.type == logType.Error.rawValue}.count ?? 0)
                let infoCount = Double(detailArr?.filter{$0.type == logType.Info.rawValue}.count ?? 0)
                let verboseCount = Double(detailArr?.filter{$0.type == logType.Verbose.rawValue}.count ?? 0)
                let warningCount = Double(detailArr?.filter{$0.type == logType.Warning.rawValue}.count ?? 0)
                
                let yse1 =  BarChartDataEntry(x: 0, y: Double(errorCount))
                let yse2 =  BarChartDataEntry(x: 1, y: Double(infoCount))
                let yse3 =  BarChartDataEntry(x: 2, y: Double(verboseCount))
                let yse4 =  BarChartDataEntry(x: 3, y: Double(warningCount))
                
                
                let ds1 = BarChartDataSet(entries: [yse1], label: "Error")
                ds1.colors = [NSUIColor(red: 241/255.0, green: 147/255.0, blue: 156/255.0, alpha: 1.0)]
                barData.addDataSet(ds1)

                let ds2 = BarChartDataSet(entries: [yse2], label: "Info")
                ds2.colors = [NSUIColor(red: 191/255.0, green: 230/255.0, blue: 140/255.0, alpha: 1.0)]
                barData.addDataSet(ds2)
                
                let ds3 = BarChartDataSet(entries: [yse3], label: "Verbose")
                ds3.colors = [NSUIColor(red: 160/255.0, green: 233/255.0, blue: 252/255.0, alpha: 1.0)]
                barData.addDataSet(ds3)

                let ds4 = BarChartDataSet(entries: [yse4], label: "Warning")
                ds4.colors = [NSUIColor(red: 252/255.0, green: 245/255.0, blue: 152/255.0, alpha: 1.0)]
                barData.addDataSet(ds4)
                

                let barWidth = 0.4
                let barSpace = 0.05
                let groupSpace = 0.1
                
                barData.barWidth = barWidth
                
                barData.groupBars(fromX: Double(barData.xMin), groupSpace: groupSpace, barSpace: barSpace)

                self.barView.data = barData
                
                self.barView.gridBackgroundColor = NSUIColor.white

            }
        }
    }
    
    
}
