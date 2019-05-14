//
//  ViewController.swift
//  Colors test
//
//  Created by Dani Rangelov on 14.05.19.
//  Copyright © 2019 Dani Rangelov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    let randomColorsPallet = [//Green
                              0x94DDDC,
                              0xAFD57B,
                              0x4A4A4A,
                              0x367D8A,
                              0x00FFFF,
                              0x40ff00,
                              0xADFF2F,
                              0x2E8B57,
                              0x64B992,
                              0x2E7556,
                              0x2ECC71,
                              0x006400,
                              0x66CDAA,
                              0x20B2AA,
                              0x008080,
                              0x3F9BB2,
                              0x00CED1,
                              0x5F9EA0,
                              0x00FA9A,
                              
                              
                              //Orange
                              0xF2AA48,
                              0xF7C233,
                              0xF39B28,
                              0xF7BA3F,
                              0xF4D03F,
                              0xFFA500,
                              0xFF4500,
                              
                              
                              //Red
                              0xF0744A,
                              0xC42B25,
                              0xE74C3C,
                              0xFF0000,
                              
                              
                              //Blue
                              0x41335D,
                              0x5AA4DA,
                              0x2B7FF7,
                              0x2E4053,
                              0x2E86C1,
                              0x6495ED,
                              0x00BFFF,
                              0x0000FF,
                              0x000080,
                              0x4B0082,
                              0x663399,
                              0x7B68EE,
                              
                              
                              //Pink
                              0xC158E5,
                              0x8331F4,
                              0xbd9bb4,
                              0xAF7AC5,
                              0xD98880,
                              0xFF69B4,
                              0xFF1493,
                              0xBA55D3,
                              0xF08080,
                              0xFFE4C4,
                              0xBC8F8F,
                              0x800000,
                              
                              //Others
                              0x8D5421,
                              0xA9A9A9,
                              0x778899,
                              0x7F8C8D,
                              
                              //Yellow
                              0xFFFF00,
                              ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomColorsPallet.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as! UITableViewCell
        let colorStr = randomColorsPallet[indexPath.row]
        let st = String(format:"#%02X", colorStr)
        cell.textLabel?.text = String(st)
        
        let backgroundColor = UIColor(rgbHex: colorStr)
        cell.textLabel?.textColor = determineTextColor(for: backgroundColor)
        cell.backgroundColor = backgroundColor
        
        return cell
    }
    
    
    func determineTextColor(for backgroundColor: UIColor) -> UIColor {
        var H: CGFloat = 0, S: CGFloat = 0, B: CGFloat = 0, A: CGFloat = 0, white: CGFloat = 0
        backgroundColor.getHue(&H, saturation: &S, brightness: &B, alpha: &A)
        backgroundColor.getWhite(&white, alpha: &A)
        return (white <= 0.5 || B <= 0.5) ? UIColor.white : UIColor(rgbHex: 0x333333)
    }
    
}


extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgbHex: Int) {
        self.init(red:(rgbHex >> 16) & 0xff, green:(rgbHex >> 8) & 0xff, blue:rgbHex & 0xff)
    }
}
