//
//  ViewController.swift
//  Modular Inversion
//
//  Created by Chien Min Soh on 1/17/16.
//  Copyright © 2016 Chien Min Soh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Answer: UILabel!
    var isTyping = false
    var result = Int()
    
    
    var p = Int()
    var isP = false
    var n = Int()
    var isN = true
    
    @IBOutlet weak var NPValue: UISegmentedControl!
    
    @IBAction func NorP(sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0) {
            isP = false
            isN = true
        }
        else {
            isP = true
            isN = false
        }
    }
    
    @IBAction func Number(sender: AnyObject) {
        let number = sender.currentTitle
        if (isTyping) {
            if (isN) {
                if ((NPValue.titleForSegmentAtIndex(0)!) == "N") {
                    NPValue.setTitle("", forSegmentAtIndex: 0)
                }
                NPValue.setTitle((NPValue.titleForSegmentAtIndex(0)! + number!!), forSegmentAtIndex: 0)
            }
            else {
                if ((NPValue.titleForSegmentAtIndex(1)!) == "P") {
                    NPValue.setTitle("", forSegmentAtIndex: 1)
                }
                NPValue.setTitle((NPValue.titleForSegmentAtIndex(1)! + number!!), forSegmentAtIndex: 1)
            }
        }
        else {
            if (isN) {
                NPValue.setTitle(number, forSegmentAtIndex: 0)
            }
            else {
                NPValue.setTitle(number, forSegmentAtIndex: 1)
            }
        }
        isTyping = true
    }
    
    @IBAction func Calculate(sender: AnyObject) {
        
        if (NPValue.titleForSegmentAtIndex(0)! == "N") {
            Answer.text = "Please enter N's value!"
            return
        }
        if (NPValue.titleForSegmentAtIndex(1)! == "P") {
            Answer.text = "Please enter P's value!"
            return
        }
        
        n = Int(NPValue.titleForSegmentAtIndex(0)!)!
        p = Int(NPValue.titleForSegmentAtIndex(1)!)!
        
        // p = 392
        // n = 27
        var remainder = Int()
        
        var tempP = p
        var tempN = n
    
        if (tempP != 1 || tempN != 1) {
            while (remainder != 1) {
                remainder = tempP % tempN
                tempP = tempN
                tempN = remainder
                if (remainder == 0) {
                    Answer.text = "Numbers must be coprime"
                    return
                }
            
            }
        }
        
        let initP = p
        var initX = 0
        var x = 1
        var q = 0
        var temp = 0
        
        if ( p == 1) {
            result = 0
            Answer.text = "\(result)"
            return
        }
        
        while (n > 1) {
            q = n / p
            temp = p
            p = n % p
            n = temp
            temp = initX
            initX = x - q * initX
            x = temp
        }
        
        if (x < 0) {
            x += initP
        }
        
        result = x
        
        Answer.text = "\(result)"
    }
    
    @IBAction func Clear(sender: AnyObject) {
        n = 0
        p = 0
        isTyping = false
        result = 0
        Answer.text = ""
        //NPValue.insertSegmentWithTitle("", atIndex: 0, animated: false)
        //NPValue.insertSegmentWithTitle("", atIndex: 1, animated: false)
        NPValue.setTitle("N", forSegmentAtIndex: 0)
        NPValue.setTitle("P", forSegmentAtIndex: 1)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

