//
//  ViewController.swift
//  CustomSheet
//
//  Created by quandemacbook on 2017/1/16.
//  Copyright © 2017年 jackxu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var  alertSheet : CustomeAlertSheet?
    override func viewDidLoad() {
        super.viewDidLoad()
        
                // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonClick(_ sender: AnyObject) {
        
        let titles:[String] = ["推荐","专题","真相","两性"]
        let detailTitles:[String] = ["推荐","专题","真相","两性"]
        alertSheet = CustomeAlertSheet.init(frame: self.view.bounds, titles: titles, detailTitles: detailTitles,type:cellType.textAndImage)
        alertSheet?.titile = [ "一图读懂","肿瘤","慢病","营养"]
        self.view.addSubview(alertSheet!)

       alertSheet?.show()
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        alertSheet?.hidden()
    }

}

