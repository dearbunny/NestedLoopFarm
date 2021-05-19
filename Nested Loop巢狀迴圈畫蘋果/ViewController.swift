//
//  ViewController.swift
//  Nested Loop巢狀迴圈畫蘋果
//
//  Created by Rose on 2021/5/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bunnyLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var patternSegmentedControl: UISegmentedControl!
    @IBOutlet weak var slider: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.setThumbImage(UIImage(named: "icon-bunny"), for: .normal)

        
    }
    // 變更數量
    @IBAction func changeBunny(_ sender: UISlider) {
        //設定分頁的常數
        let pattern = patternSegmentedControl.selectedSegmentIndex
        
        var content = ""
        sender.value = sender.value.rounded()
        // rounded 變整數四捨五入 Slider才會停在整數的地方
        let number = Int(sender.value)
        numberLabel.text = "\(number)"
        
        switch pattern {
        //單一色
        case 0:
            for _ in 1...number {
                for _ in 1...number {
                    content += "🐰"
                }
                content = content + "\n"
            }
        case 1:
            for i in 1...number {
                for j in 1...number {//如果是第number行，圖案是"🐰"
                    if i == number{
                        content +=  "🐰"
                    }else{ //否則圖案都是"🥕"
                        content += "🥕"
                    }
                }
                content = content + "\n"
            }
        case 2:
            for i in 1...number {
                for j in 1...number {
                    if i == (number + 1 - j) {
                        content +=  "🐰"
                    }else{
                        content += "🥕"
                    }
                }
                content = content + "\n"
            }
        case 3:
            for i in 1...number {
                for j in 1...number {
                    if i % 2 == 0 && j % 2 != 0 || i % 2 != 0 && j % 2 == 0 {
                        content += "🐰"
                    }else{
                        content += "🥕"
                    }
                }
                content = content + "\n"
            }
        default:
            return
        }
        
//        for i in 1...number {
//            for _ in 1...number {
//                content += "🐰"
//            }
//            content += "\n"
//        }
        bunnyLabel.text = content
    }
    


}
