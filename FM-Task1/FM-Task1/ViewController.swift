//
//  ViewController.swift
//  FM-Task1
//
//  Created by SoiriYuichi on 2022/06/24.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var stockListTable: UITableView!
    @IBOutlet weak var commentField: UITextField!
    
    var mytimer:Timer!
    var stock = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timecheck()
        mytimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timecheck), userInfo: nil, repeats: true)
    
        stockListTable.dataSource = self
        stockListTable.delegate = self
        commentField.delegate = self
        
    
    }
        
    @IBAction func countUpButton(_ sender: Any) {
        var nowCount = Int(countLabel.text!)
        if nowCount! < 9999 {
            //+ボタンで１を足す
            nowCount! += 1
            countLabel.text = String.localizedStringWithFormat("%d", nowCount!)
        }
    }
    
    @IBAction func countDownButton(_ sender: Any) {
        var nowCount = Int(countLabel.text!)
        if nowCount! > 0 {
        //-ボタンで１を引く
        nowCount! -= 1
        countLabel.text = String.localizedStringWithFormat("%d", nowCount!)
        }
    }
    
    @IBAction func addStockList(_ sender: Any) {
        stock.append(commentField.text!)
        commentField.text = ""
        stockListTable.reloadData()
    }
    
    @objc func timecheck(){
        //時間を表示する
        let nowdate = Date()
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("Hms")
        date.text = formatter.string(from: nowdate)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stock.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "stockList", for: indexPath)
        cell.textLabel!.text = stock[indexPath.row]
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    

    
}

