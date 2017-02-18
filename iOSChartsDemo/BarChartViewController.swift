//
//  BarChartViewController.swift
//  
//
//  Created by 洪德晟 on 2017/2/18.
//
//

import UIKit
import Charts

class BarChartViewController: UIViewController,ChartViewDelegate {

    @IBOutlet weak var barChartView: BarChartView!
    var months: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        
        setChart(dataPoints: months, values: unitsSold)
        
        // 觸發事件
        barChartView.delegate = self
    }
    
    // 圖表儲存
    @IBAction func saveChart(_ sender: Any) {
        barChartView.save(to: "xx", format: .jpeg, compressionQuality: 1.0)
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        
        let formato:BarChartFormatter = BarChartFormatter()
        let xaxis:XAxis = XAxis()
        
        // 客製化無資料狀態的訊息
        barChartView.noDataText = "You need to provide data for the chart."
        barChartView.noDataTextColor = UIColor.orange
        barChartView.noDataFont = UIFont(name: "Helvetica Light", size: 16)
        
        // 獲取資料點，來呈現圖表
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
//            formato.stringForValue(Double(i), axis: xaxis)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Unit Sold")
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.data = chartData
        
        // 設定敘述文字為空字串
        barChartView.chartDescription?.text = ""
        
        // 變更長條圖的的預設顏色
        chartDataSet.colors = ChartColorTemplates.colorful()
        
        // 變更x軸標籤的位置
        barChartView.xAxis.labelPosition = .bottom
        
        // 設定x軸標籤內容: github.com/danielgindi/Charts/issues/1340
        xaxis.valueFormatter = formato
        barChartView.xAxis.valueFormatter = xaxis.valueFormatter
        
        // 變更圖表的背景顏色
        barChartView.backgroundColor = UIColor.lightGray
        
        // 動畫
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInBounce)
        
        // 加入界線至圖表中
        let ll = ChartLimitLine(limit: 10.0, label: "Target")
        barChartView.rightAxis.addLimitLine(ll)
        
    }
    
    // 觸發事件 - 點擊後做的事
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        guard (months) != nil else { return }
        print("\(entry.y) in \(months[Int(entry.x)])")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

public class BarChartFormatter: NSObject, IAxisValueFormatter{
    
    var months: [String]! = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        
        return months[Int(value)]
    }
}
