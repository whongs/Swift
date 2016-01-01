//
//  ViewController.swift
//  Test6
//
//  Created by whs on 15/12/25.
//  Copyright © 2015年 whs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let names = ["Chris", "Alex","Ewa","Barry","Daniella"]
        
//        let resersed = names.sort(backwards)
//        print(resersed)
        
//       let  reversed = names.sort({ (fir: String, sec: String) -> Bool in
//            return fir > sec
//        })
        
//        let reversed = names.sort({(fir: String, sec:String) -> Bool in
//        
//        return fir > sec
//        })
        
        
//        let reversed = names.sort({(fir:String,sec:String) -> Bool in return fir > sec })
        //let reversed = names.sort({(fir , sec ) -> Bool in return fir > sec})
        //let reversed = names.sort({(fir , sec) -> Bool in fir > sec })
        
        //let reversed = names.sort({$0 > $1})
        //let reversed = names.sort(<)
        //print(reversed)
        
        
//        let strings = names.map{(str : String) -> String in
//        return str + "hehe"
//        }
//        print(strings)
//        
        
        let strings = self.increasment(amount: 5)
        print(strings())
        
     }
    
    func increasment(amount amount:Int) -> (() -> Int){
        var total = 0
        func incrementAmount() -> Int{
           total += amount
           return total
        }
      
        return incrementAmount
    }
    
    
//    func backwards(s1:String, s2:String) -> Bool{
//    return s1 > s2
//    
//    
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

