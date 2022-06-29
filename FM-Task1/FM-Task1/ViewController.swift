//
//  ViewController.swift
//  FM-Task1
//
//  Created by SoiriYuichi on 2022/06/24.
//

import UIKit

class ViewController: UIViewController {

    var mytimer:Timer!

    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        //Storyboard上で設定したので不要
        //var initCount = 0
        //countLabel.text = String(initCount)
    
        timecheck()
        
        mytimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timecheck), userInfo: nil, repeats: true)


    }
        
    @IBAction func plusButton(_ sender: Any) {
        
        var nowCount = Int(countLabel.text!)
        if nowCount! < 9999 {
            //+ボタンで１を足す
            nowCount! += 1
            countLabel.text = String.localizedStringWithFormat("%d", nowCount!)
        }
    }
    
    @IBAction func minusButton(_ sender: Any) {
        
        var nowCount = Int(countLabel.text!)
        if nowCount! > 0 {
        //-ボタンで１を引く
        nowCount! -= 1
        countLabel.text = String.localizedStringWithFormat("%d", nowCount!)
        }
        
    }
    
    @objc func timecheck(){
        //時間を表示する
        let nowdate = Date()
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("Hms")
        date.text = formatter.string(from: nowdate)
    
    }
    
    
    
}

