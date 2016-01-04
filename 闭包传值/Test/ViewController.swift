//
//  ViewController.swift
//  Test
//
//  Created by whs on 15/12/29.
//  Copyright © 2015年 whs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myLabel:UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let item = UIBarButtonItem(title: "下一页", style: UIBarButtonItemStyle.Plain, target: self, action: "nextBtnClicked")
        self.navigationItem.rightBarButtonItem = item
        
        myLabel = UILabel(frame: CGRect(x: 0, y: 100, width: 320, height: 50))
        myLabel?.text = "Closure"
        myLabel?.backgroundColor = UIColor.cyanColor()
        myLabel?.textAlignment = NSTextAlignment.Center
        self.view.addSubview(myLabel!)
        
    }
    func someFunctionThatTakesAClosure(string:String) -> Void{
     myLabel?.text = string
    }
    
    
    func nextBtnClicked(){
       let second = RootViewController()
        second.initWithClosure(someFunctionThatTakesAClosure)
        self.navigationController?.pushViewController(second, animated: true)
    
    
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

