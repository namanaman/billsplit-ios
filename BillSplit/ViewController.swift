//
//  ViewController.swift
//  BillSplit
//
//  Created by Naman Agrawal.
//  Copyright (c) 2015 Naman Agrawal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    
    // Original values
    var subtotal = 0.00
    var tip = 0.00
    var tip_percent = 15.0
    var total = 0.00
    var people = 2.0
    var split_cost = 0.00
    
    @IBOutlet weak var subtotal_field: UITextField!
    @IBOutlet weak var tip_label: UILabel!
    @IBOutlet weak var tip_cost: UILabel!
    @IBOutlet weak var total_cost: UILabel!
    @IBOutlet weak var people_num: UILabel!
    @IBOutlet weak var split_label: UILabel!
    @IBOutlet weak var pay_or_charge: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDoneButtonToKeyboard()
    }
    
    // MARK: UITextFieldDelegate
    
    func addDoneButtonToKeyboard() {
        let doneButton:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "hideKeyboard")
        
        let space:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        
        var items = [AnyObject]()
        items.append(space)
        items.append(doneButton)
        
        let toolbar = UIToolbar()
        toolbar.frame.size.height = 35
        toolbar.items = items as? [UIBarButtonItem]
        
        subtotal_field.inputAccessoryView = toolbar
    }
    
    func hideKeyboard() {
        subtotal_field.resignFirstResponder()
        subtotal = Double(subtotal_field.text!)!
        calculate()
    }
    
    func calculate() {
        // Calculates all values at once
        
        tip = (tip_percent/100.0)*subtotal
        tip_cost.text = String(format:"%.2f", tip)
        
        total = subtotal + tip
        total_cost.text = String(format:"%.2f", total)
        
        split_cost = total/people
        split_label.text = String(format:"%.2f", split_cost)
    }
    
    @IBAction func change_tip(sender: UIStepper) {
        tip_percent = sender.value
        tip_label.text = String(format:"%.f", tip_percent)
        calculate() // Updates values in real-time
    }
    
    @IBAction func change_people(sender: UIStepper) {
        people = sender.value
        people_num.text = String(format:"%.f", people)
        calculate() // Updates values in real-time
    }
    
}