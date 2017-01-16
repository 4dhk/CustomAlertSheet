//
//  CustomeAlertSheet.swift
//  输入框
//
//  Created by quandemacbook on 2016/12/28.
//  Copyright © 2016年 daquan xu. All rights reserved.
//

import UIKit

struct sourceArray{
    var titleArray:[String]
    var detailTitleArray:[String]
}

enum cellType : Int{
    case textAndText = 0
    case textAndImage = 1
}

class CustomeAlertSheet: UIView,UITableViewDelegate,UITableViewDataSource {
   var screenWidth:CGFloat = UIScreen.main.bounds.width
   var screenHeight:CGFloat = UIScreen.main.bounds.height
   let bgView = UIView()
   var tableView = UITableView()
   var titile = [String]()
   var detailTitile = [String]()
   var type : cellType?
//    var configure : sourceArray!{
//        didSet{
//           tableView.reloadData()
//        }
//    }
    
    init(frame: CGRect,titles:[String],detailTitles:[String],type:cellType) {
        super.init(frame: frame)
        self.frame  = CGRect(x: 0, y: 0, width: screenWidth, height:screenHeight)
        self.backgroundColor = UIColor.black;
        self.alpha = 0.8
        self.type = type
        self.titile = titles
        self.detailTitile = detailTitles
        self.creatSheetBgView()
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatSheetBgView(){
        bgView.frame = CGRect(x: 0, y: screenHeight, width: screenWidth, height: 240)
        bgView.backgroundColor = UIColor.white
        self.addSubview(bgView)
        
        
        tableView = UITableView(frame: CGRect(x:0,y:0,width:screenWidth,height:240), style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        bgView .addSubview(tableView)
        let cellNib = UINib(nibName:"CustomTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "CustomTableViewCell")
    }
    
    //MARk UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        self.hidden()
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titile.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var  cell = UITableViewCell()
        if self.type!.rawValue==0 {
            cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "cell")
            cell.textLabel?.text = self.titile[indexPath.row]
            cell.detailTextLabel?.text = self.detailTitile[indexPath.row]

        }else if self.type!.rawValue==1 {
            
            //根据自己的需要自定义cell 此处只给出简单示例
            let cell : CustomTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell)!
            cell.contextLabel.text = self.titile[indexPath.row]
            return cell
            
        }
        return cell
    }
    
    func  show(){
       UIView.animate(withDuration: 0.2) {
          self.bgView.frame = CGRect(x: 0, y: self.screenHeight-240, width: self.screenWidth, height: 240)
        }
    }
    
    func hidden(){
        
        UIView.animate(withDuration: 0.2, animations: { 
            self.bgView.frame = CGRect(x: 0, y: self.screenHeight, width: self.screenWidth, height: 240)
            
            }) { (true) in
                self.bgView.removeFromSuperview()
                self.removeFromSuperview()
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.hidden()
    }
}
