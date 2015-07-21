//
//  ViewController.swift
//  ColorSelector
//
//  Created by WangZhuo on 15/7/10.
//  Copyright © 2015年 WangZhuo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var RedSlider: UISlider!
    @IBOutlet weak var GreenSlider: UISlider!
    @IBOutlet weak var BlueSlider: UISlider!
    @IBOutlet weak var AlphaSlider: UISlider!
    @IBOutlet weak var RedText: UITextField!
    @IBOutlet weak var BlueText: UITextField!
    @IBOutlet weak var GreenText: UITextField!
    @IBOutlet weak var AlphaText: UITextField!
    @IBOutlet weak var TapButton: UIButton!
//    @IBOutlet weak var Switch: UISwitch!
//    
//    @IBAction func SwitchValueChanged(sender: UISwitch) {
//        
//        
//    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        RedSlider.maximumValue=255
        RedSlider.minimumValue=0
        RedSlider.value=RedSlider.minimumValue
        //RedSlider.continuous=Switch.on
        RedSlider.continuous=true
        RedSlider.addTarget(self, action: Selector("ValueChanged"), forControlEvents: UIControlEvents.ValueChanged)
        
        GreenSlider.maximumValue=255
        GreenSlider.minimumValue=0
        GreenSlider.value=GreenSlider.minimumValue
        GreenSlider.continuous=true
        GreenSlider.addTarget(self, action: Selector("ValueChanged"), forControlEvents: UIControlEvents.ValueChanged)
        
        BlueSlider.maximumValue=255
        BlueSlider.minimumValue=0
        BlueSlider.value=BlueSlider.minimumValue
        BlueSlider.continuous=true
        BlueSlider.addTarget(self, action: Selector("ValueChanged"), forControlEvents: UIControlEvents.ValueChanged)
        
        AlphaSlider.maximumValue=255
        AlphaSlider.minimumValue=0
        AlphaSlider.value=AlphaSlider.minimumValue
        AlphaSlider.continuous=true
        AlphaSlider.addTarget(self, action: Selector("ValueChanged"), forControlEvents: UIControlEvents.ValueChanged)
        
        RedText.delegate=self
        GreenText.delegate=self
        BlueText.delegate=self
        AlphaText.delegate=self
        
        
        TapButton.addTarget(self, action: Selector("ValueChangedByButton"), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField.text==""{
            textField.text="0"
        }
        else if (textField.text! as NSString).floatValue>255{
            textField.text="255"
        }
        else if (textField.text! as NSString).floatValue<0{
            textField.text="0"
        }

        ValueChangedByButton()
        textField.resignFirstResponder()
        return true
    }
    
    
    
    func ValueChanged(){
        TapButton.backgroundColor=UIColor(red: CGFloat(RedSlider.value/255), green: CGFloat(GreenSlider.value/255), blue: CGFloat(BlueSlider.value/255), alpha: CGFloat(AlphaSlider.value/255))
        
        RedText.text=RedSlider.value.description
        GreenText.text=GreenSlider.value.description
        BlueText.text=BlueSlider.value.description
        AlphaText.text=AlphaSlider.value.description
    }
    
    func ValueChangedByButton(){
        RedSlider.value=(RedText.text! as NSString).floatValue
        GreenSlider.value=(GreenText.text! as NSString).floatValue
        BlueSlider.value=(BlueText.text! as NSString).floatValue
        AlphaSlider.value=(AlphaText.text! as NSString).floatValue
        ValueChanged()
    }

}

