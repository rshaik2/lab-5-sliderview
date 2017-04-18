//
//  ViewController.swift
//  
//
//  Created by Riyaz12 on 30/03/17.
//  Copyright © 2017 Riyaz12. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let step:Float = 1
    
    @IBOutlet var myTableview: UITableView!
    
    var tableviewdataArray = NSArray()
    


    @IBOutlet var myslider: UISlider!
    
    var finalslidervalue = Int()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myslider.minimumValue = 0
        myslider.maximumValue = 100
        myslider.isContinuous = true
        myslider.tintColor = UIColor.green
        myslider.addTarget(self, action: #selector(ViewController.sliderValueDidChange(_:)), for: .valueChanged)
        
        self.view.addSubview(myslider)
    }

    func sliderValueDidChange(_ sender:UISlider!)
    {
        
        // Use this code below only if you want UISlider to snap to values step by step
        let roundedStepValue = round(sender.value / step) * step
        
        sender.value = roundedStepValue
        
        
        self.finalslidervalue = Int(roundedStepValue)
        
        self.myTableview.reloadData()
        
        print("Slider step value \(Int(roundedStepValue))")
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "UICellID") as UITableViewCell!
        
        if !(cell != nil)
        {
            cell = UITableViewCell(style:.default, reuseIdentifier: "UICellID")
        }
        
        cell?.textLabel?.text = String(self.finalslidervalue)
        cell?.textLabel?.textColor = UIColor.red
        cell?.textLabel?.textAlignment = .center
        cell?.textLabel?.font = cell?.textLabel?.font.withSize(30)
        
        
        return cell!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

