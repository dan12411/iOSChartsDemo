# Charts


* Charts API github : https://github.com/danielgindi/Charts

* 主要參考教學：http://www.appcoda.com.tw/ios-charts-api-tutorial/，但此份教學是用之前的版本所寫的，所以部分語法與需要更新。

* 如果在Swift3、Charts 3.0、Xcode8的環境下，可參考：https://medium.com/@skoli/using-realm-and-charts-with-swift-3-in-ios-10-40c42e3838c0#.n8ffy5nkx

---

* 實作過程遇到的問題：

    1. 版本更新後，如何輸出X Axis的值：

          * How to Modify X Axis values Swift? : https://github.com/danielgindi/Charts/issues/1340

          * 需要另外建立一個新的class for IAxisValueFormatter

    2. 輸出X Axis的值之後，目前bar chart只顯示出單數的值

    3. pie chart沒有XAxis的屬性

    4. 發生小插曲:Could not cast value of type 'Charts.LineChartData' (0x10f044920) to 'Charts.PieChartData' (0x10f0476c8). 因為在拉Outlet時，把名稱取相反造成Crash。



