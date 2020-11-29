//
//  PieChart.swift
//  LoggyAnalytics
//
//  Created by Siddhant Mishra on 23/11/20.
//

import Cocoa
import Charts
import Foundation

class PieChart: NSView ,NibLoadable{
    
    @IBOutlet weak var pieChartView: PieChartView!
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        Bundle.main.loadNibNamed("PieChart", owner: self, topLevelObjects: nil)
        let contentFrame = NSMakeRect(0, 0, self.frame.size.width, self.frame.size.height)
        self.pieChartView.frame = contentFrame
        self.pieChartView.layer?.backgroundColor = Constants.backgroundColor?.cgColor
        self.addSubview(self.pieChartView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc dynamic var detailArr:[LogRecord]?{
        didSet{
            if detailArr?.count ?? 0 > 0{
                
                var dataEntry = [PieChartDataEntry]()
                let errorCount = Double(detailArr?.filter{$0.type == logType.Error.rawValue}.count ?? 0)
                let infoCount = Double(detailArr?.filter{$0.type == logType.Info.rawValue}.count ?? 0)
                let verboseCount = Double(detailArr?.filter{$0.type == logType.Verbose.rawValue}.count ?? 0)
                let warningCount = Double(detailArr?.filter{$0.type == logType.Warning.rawValue}.count ?? 0)
                
                let arrCount = Double(detailArr!.count)
                
                let yse1 =  PieChartDataEntry(value: Double(errorCount/arrCount * 100), label: "Error")
                let yse2 =  PieChartDataEntry(value: Double(infoCount/arrCount * 100), label: "Info")
                let yse3 =  PieChartDataEntry(value: Double(verboseCount/arrCount * 100), label: "Verbose")
                let yse4 =  PieChartDataEntry(value: Double(warningCount/arrCount * 100), label: "Warning")
                
                dataEntry.append(yse1)
                dataEntry.append(yse2)
                dataEntry.append(yse3)
                dataEntry.append(yse4)
                
                let data = PieChartData()
                
                let ds1 = PieChartDataSet(entries: dataEntry, label: "Hello")
                
                
                ds1.colors = ChartColorTemplates.vordiplom()
                ds1.entryLabelColor = .black
                ds1.valueTextColor = .black
                
                data.addDataSet(ds1)
                
                self.pieChartView.data = data
                
                
            }
        }
    }
}
