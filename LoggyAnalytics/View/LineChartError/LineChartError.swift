////
////  LineChartError.swift
////  LoggyAnalytics
////
////  Created by Siddhant Mishra on 23/11/20.
////
//
//import Cocoa
//import Charts
//
//class LineChartError: NSView,NibLoadable {
//    @IBOutlet weak var lineView: LineChartView!
//    
//    override init(frame frameRect: NSRect) {
//        super.init(frame: frameRect)
//        
//        Bundle.main.loadNibNamed("LineChartError", owner: self, topLevelObjects: nil)
//        let contentFrame = NSMakeRect(0, 0, self.frame.size.width, self.frame.size.height)
//        self.lineView.frame = contentFrame
//        self.lineView.layer?.backgroundColor = Constants.backgroundColor?.cgColor
//        self.addSubview(self.lineView)
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
//    
//    var detailArr:[LogRecord]?{
//        didSet{
//            if detailArr?.count ?? 0 > 0{
//                var dataEntry = [ChartDataEntry]()
//                
//                if let errors = detailArr?.filter{$0.type == logType.Error.rawValue}{
//                    for item in errors{
//                        let yse1 =  ChartDataEntry(x: 0, y: )
//                    }
//                }
//                
//                
//                
//                //                let infoCount = detailArr?.filter{$0.type == logType.Info.rawValue}.count ?? 0 / detailArr!.count
//                //                let verboseCount = detailArr?.filter{$0.type == logType.Verbose.rawValue}.count ?? 0 / detailArr!.count
//                //                let warningCount = detailArr?.filter{$0.type == logType.Warning.rawValue}.count ?? 0 / detailArr!.count
//                
//                let yse1 =  ChartDataEntry(x: 0, y: Double(errorCount * 100))
//                //                let yse2 =  ChartDataEntry(x: 0, y: Double(infoCount * 100))
//                //                let yse3 =  ChartDataEntry(x: 0, y: Double(verboseCount * 100))
//                //                let yse4 =  ChartDataEntry(x: 0, y: Double(warningCount * 100))
//                
//                dataEntry.append(yse1)
//                //                dataEntry.append(yse2)
//                //                dataEntry.append(yse3)
//                //                dataEntry.append(yse4)
//                
//                let data = BarChartData()
//                
//                let ds1 = LineChartDataSet(entries: [yse1], label: "Error")
//                //                let ds2 = LineChartDataSet(entries: [yse2], label: "Info")
//                //                let ds3 = LineChartDataSet(entries: [yse3], label: "Verbose")
//                //                let ds4 = LineChartDataSet(entries: [yse4], label: "Warning")
//                
//                ds1.setCircleColor(.systemRed)
//                //                ds2.colors = [NSUIColor.blue]
//                //                ds3.colors = [NSUIColor.systemGreen]
//                //                ds4.colors = [NSUIColor.yellow]
//                
//                data.addDataSet(ds1)
//                //                data.addDataSet(ds2)
//                //                data.addDataSet(ds3)
//                //                data.addDataSet(ds4)
//                
//                self.lineView.data = data
//                
//            }
//        }
//    }
//}
