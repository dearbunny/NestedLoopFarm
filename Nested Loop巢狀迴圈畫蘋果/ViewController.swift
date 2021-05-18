//
//  ViewController.swift
//  Nested Loop巢狀迴圈畫蘋果
//
//  Created by Rose on 2021/5/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appleLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    // 變更數量
    @IBAction func changeApple(_ sender: UISlider) {
        var content = ""
        sender.value = sender.value.rounded()
        // rounded 變整數四捨五入 Slider才會停在整數的地方
        let number = Int(sender.value)
        numberLabel.text = "\(number)"
        
        for i in 1...number {
            for _ in 1...number {
                content += "🍎"
            }
            content += "\n"
        }
        appleLabel.text = content
    }
    


}
