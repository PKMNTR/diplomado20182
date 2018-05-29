//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by d182_Ricardo_R on 16/03/18.
//  Copyright © 2018 d182_Ricardo_R. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet var celsiusLabel : UILabel!
    @IBOutlet var textField : UITextField!
    var fahrenheitValue : Measurement<UnitTemperature>?
    {
        didSet{
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue : Measurement<UnitTemperature>?
    {
        if let fahrenheitValue = fahrenheitValue
        {
            return fahrenheitValue.converted(to: .celsius)
        }
        else
        {
            return nil
        }
    }
    
    let numberFormatter : NumberFormatter = {
        let nf  = NumberFormatter()
        nf.numberStyle = .decimal
        nf.maximumFractionDigits = 0
        nf.minimumFractionDigits = 1
        return nf
    }()
    
    func updateCelsiusLabel()
    {
        if let celsiusValue = celsiusValue
        {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        }
        else{
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField)
    {
//        if let text = textField.text, let value = Double(text)
        if let text = textField.text, let number = numberFormatter.number(from: text)
        {
//            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
            fahrenheitValue = Measurement(value: number.doubleValue, unit: .fahrenheit)
        }
        else{
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer)
    {
        textField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ConversionViewController cargado")
        
        updateCelsiusLabel()
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
//        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
//        let replacementTextHasDecimalSeparator = string.range(of: ".")
        
        let currentLocale = Locale.current
        let decimalSeparator = currentLocale.decimalSeparator ?? "."
        
        let existingTextHasDecimalSeparator = textField.text?.range(of: decimalSeparator)
        let replacementTextHasDecimalSeparator = string.range(of: decimalSeparator)
        
        if existingTextHasDecimalSeparator != nil,
            replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true }
    }
    
}


