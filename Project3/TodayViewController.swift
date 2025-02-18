//
//  TodayViewController.swift
//  Project3
//
//  Created by Siddharth Ansh on 18/02/25.
//

import UIKit

class TodayViewController: UIViewController,UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    
    struct TodayData {
        let topic : String
        let header : String
        let subHeader : String
        let date : String
    }
    
    let data : [TodayData] = [
        TodayData(topic: "Shift", header: "Good morning Jeff", subHeader: "Your shift will start in 15 minutes", date: "8:30 AM - 4:30 PM"),
        TodayData(topic: "Shift", header: "Good morning Jeff", subHeader: "Your shift will start in 15 minutes", date: "8:30 AM - 4:30 PM"),
        TodayData(topic: "Shift", header: "Good morning Jeff", subHeader: "Your shift will start in 15 minutes", date: "8:30 AM - 4:30 PM"),
        TodayData(topic: "Shift", header: "Good morning Jeff", subHeader: "Your shift will start in 15 minutes", date: "8:30 AM - 4:30 PM"),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = data[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodayDataTableViewCell
        cell.topic.text = cellData.topic
        cell.header.text = cellData.header
        cell.subHeader.text = cellData.subHeader
        cell.date.text = cellData.date
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
