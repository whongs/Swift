//
//  RootViewController.swift
//  Test
//
//  Created by whs on 15/12/29.
//  Copyright © 2015年 whs. All rights reserved.
//

import UIKit
 typealias sendValueClosure = (string:String) ->Void


class RootViewController: UIViewController {

    var i:Int?
    //声明一个闭包
    var myClosure:sendValueClosure?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
        self.title = "second"
        self.view.backgroundColor = UIColor.whiteColor()
        
        
        i = 0
        let btn = UIButton(type: UIButtonType.Custom)
        btn.frame = CGRectMake(50,100,100,30)
        btn.setTitle("点击我" ,forState:UIControlState.Normal)
        btn.backgroundColor = UIColor.cyanColor()
        btn.addTarget(self,action:"action", forControlEvents:UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
        
    }
    
    func action(){
        i = i!+1
        //判空
        if (myClosure != nil){
            //闭包隐式调用someFunctionThatTakesAClosure函数：回调。
            myClosure!(string: "好好哦\(i)")
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
    }

    //下面这个方法需要传入上个界面的someFunctionThatTakesAClosure函数指针
    func initWithClosure(closure:sendValueClosure?){
    //将函数指针赋值给myClosure闭包，该闭包中涵盖了someFunctionThatTakesAClosure函数中的局部变量等的引用
        myClosure = closure
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
