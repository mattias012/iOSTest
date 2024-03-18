//
//  ViewController.swift
//  MA
//
//  Created by Mattias Axelsson on 2024-03-10.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let segueId = "goToSecondSegue"
    
    let userDefaultKey = "defaultRowsKey"
    
    let converter = CelsiusConverter()
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var pickerViewCelsius: UIPickerView!
    var tempValues = (-100...100).reversed().map{$0}

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let defaultRow = intitalPickerRow()
        pickerViewCelsius.selectRow(defaultRow, inComponent: 0, animated: false)
        pickerView(pickerViewCelsius, didSelectRow: defaultRow, inComponent: 0)
        
    }


    @IBAction func buttonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: segueId, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueId {
            if let destinationVC = segue.destination as? ResultViewController {
                destinationVC.recivingName = nameField.text
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tempValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(tempValues[row]) ºC"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        let tempC = tempValues[row]
        let tempF = converter.degreesFahrenheit(degreesCelsius: tempC)
        
        tempLabel.text = "\(tempF) ºF"
        savveSelected(row: row)
    }
    
    func savveSelected(row: Int){
        let defaults = UserDefaults.standard
        
        defaults.set(row, forKey: userDefaultKey)
        defaults.synchronize()
    }
    
    func intitalPickerRow() -> Int {
        
        let saveRow = UserDefaults.standard.object(forKey: userDefaultKey) as? Int
        
        if let row = saveRow {
            return row
        } else {
            return tempValues.count / 2
        }
        
    }
}

