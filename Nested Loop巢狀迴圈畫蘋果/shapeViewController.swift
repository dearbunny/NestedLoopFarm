//
//  shapeViewController.swift
//  Nested Loop巢狀迴圈畫蘋果
//
//  Created by Rose on 2021/5/19.
//

import UIKit

class shapeViewController: UIViewController {
    
    @IBOutlet weak var shapeLabel: UILabel!
    @IBOutlet weak var numberLabel2: UILabel!
    @IBOutlet weak var shapeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var slider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.setThumbImage(UIImage(named: "icon-fox"), for: .normal)

        var content = ""
        for i in 1...2 {
            for j in 1...2 {
                if i == j {
                    content += "⭐️"
                }else{
                    content += "🦊"
                }
            }
            content += "\n"
        }
        shapeLabel.text = content
    }
    
    @IBAction func changeShape(_ sender: UISlider) {
        let shape = shapeSegmentedControl.selectedSegmentIndex
        sender.value = sender.value.rounded()
        let number = Int(sender.value)
        numberLabel2.text = "\(number)"
        var content = ""
        switch shape{
        case 0: //矩形
            for i in 1...number {
                for j in 1...number {
                    if i < j{
                        content += "⭐️"
                    }else{
                        content += "🦊"
                    }
                }
                content += "\n"
            }
        case 1: //三角形
            for i in 1...number {
                for j in 1...number + 1 - i {
                    if j == number + 1 - i {
                        content += "🌱"
                    }else{
                        content += "🐞"
                    }
                }
                content += "\n"
            }
        case 2: // 金字塔
            let height:Int = number
            for row in (1..<height + 1) {
                let starCount = 2 * row - 1
                let spaceCount = height - row
                let spaceInFront = String(repeating: "💦", count: spaceCount)
                let stars = String(repeating: "🐙", count: starCount)
                
                print(spaceInFront)
                content += spaceInFront + stars
                content += "\n"
            }
        case 3:
            let height: Int = number * 2 - 1
            if height > 2, height % 2 != 0 {
                for row in (1..<height + 1) {
                    var starCount = 0
                    var spaceCount = 0
                    if (row <= (height / 2 + 1)) {
                        starCount = row * 2 - 1
                        spaceCount = (height / 2 + 1) - row
                    }else{
                        starCount = (height - row) * 2 + 1
                        spaceCount = row - (height / 2 + 1)
                    }
                    let spaceInFront = String(repeating: "✨", count: spaceCount)
                    let stars = String(repeating: "🌸", count: starCount)
                    print(spaceInFront)
                    
                    content += spaceInFront + stars
                    content += "\n"
                }
            }
            
            
        default:
            return
        }
        shapeLabel.text = content
        
        
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
