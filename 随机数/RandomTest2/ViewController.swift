//
//  ViewController.swift
//  RandomTest2
//
//  Created by whs on 15/12/24.
//  Copyright © 2015年 whs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //使用arc4random()、arc4random_uniform()取得随机数
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //下面是使用arc4random函数求一个1~100的随机数（包括1和100）
        let temp:Int = Int(arc4random() % 100) + 1
        print("\(temp)")
        
        //下面是使用arc4random_uniform函数求一个1~100的随机数（包括1和100）
        let temp2:Int = Int(arc4random_uniform(100)) + 1
        print("\(temp2)")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

