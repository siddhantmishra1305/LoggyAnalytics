//
//  ViewController.swift
//  LoggyAnalytics
//
//  Created by Siddhant Mishra on 21/11/20.
//

import Cocoa

class LaunchViewController: NSViewController {
    
    
    @IBOutlet weak var mainView: NSView!
    @IBOutlet weak var titleLbl: NSTextField!
    @IBOutlet weak var descriptionLbl: NSTextField!
    @IBOutlet weak var appLogo: NSImageView!
    @IBOutlet weak var getStartedBtn: NSButton!
    
    var selectedLogFilePath : URL?
    //    @objc dynamic var logDetailArr = [LogRecord]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.window?.styleMask.remove(.resizable)
        mainView.layer?.backgroundColor = Constants.backgroundColor?.cgColor
//        getStartedBtn.contentTintColor = Constants.titleColor
        
    }
    
    @IBAction func getStartedAction(_ sender: Any) {
        
        guard let window = view.window else { return }
        
        let dialog = NSOpenPanel();
        
        dialog.title                   = "Select log file";
        dialog.showsResizeIndicator    = true;
        dialog.showsHiddenFiles        = false;
        dialog.allowsMultipleSelection = false;
        dialog.canChooseDirectories = false;
        dialog.allowedFileTypes        = ["txt"];
        
        
        dialog.beginSheetModal(for: window) { [weak self] (result) in
            if result.rawValue == NSApplication.ModalResponse.OK.rawValue {
                if let path = dialog.url?.path{
                    if let (fileReadComplete,logDetails) = self?.readFile(path){
                        if fileReadComplete == 0{
                            //Navigate to next screen
                            let storyboard = NSStoryboard(name: "Main", bundle: nil)
                            let destVC = storyboard.instantiateController(withIdentifier: "LogReportController") as! LogReportController
                            destVC.detailArr = logDetails
                            self?.present(destVC as NSViewController,
                                          animator: ReplacePresentationAnimator())
                        }else{
                            //Unable to read file
                        }
                    }
                }
            }
        }
    }
    
    func readFile(_ path: String) -> (Int,[LogRecord]) {
        var logDetailArr = [LogRecord]()
        errno = 0
        if freopen(path, "r", stdin) == nil {
            perror(path)
            return (1,[])
        }
        while let line = readLine() {
            if line.count > 0{
                if let record = processLine(line: line){
                    logDetailArr.append(record)
                }
            }
        }
        return (0,logDetailArr)
    }
    
    
    func processLine(line:String)->LogRecord?{
        let detail = line.components(separatedBy: "|")
        if detail.count > 5{
            let logInfo = LogRecord(filename: detail[2], funcName: detail[3], line: detail[4], type: detail[0], timeStamp: detail[1], desc: detail[5])
            return logInfo
        }
        return nil
    }
}

