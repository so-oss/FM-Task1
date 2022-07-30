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
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var commentField: UITextField!
    
    var mytimer:Timer!
    var commentArray = [String]()
    var timeArray = [String]()
    var countArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        countLabel.text = String(0)
        timecheck()
        mytimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timecheck), userInfo: nil, repeats: true)
    
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")

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
        commentArray.append(commentField.text!)
        timeArray.append(date.text!)
        countArray.append(countLabel.text!)
        commentField.text = ""
        
        tableView.reloadData()
    }
    
    @objc func timecheck(){
        //時間を表示する
        let nowdate = Date()
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("Hms")
        date.text = formatter.string(from: nowdate)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! TableViewCell

        let timeCell = cell.contentView.viewWithTag(1) as! UILabel
        let countCell = cell.contentView.viewWithTag(2) as! UILabel
        let commentCell = cell.contentView.viewWithTag(3) as! UILabel

        timeCell.text = timeArray[indexPath.row]
        countCell.text = countArray[indexPath.row]
        commentCell.text = commentArray[indexPath.row]

        let nowCount = Int(countArray[indexPath.row])
        if nowCount! % 2 == 0{
            cell.backgroundColor = UIColor.yellow
        }else{
            cell.backgroundColor = UIColor.green
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    

    
}


