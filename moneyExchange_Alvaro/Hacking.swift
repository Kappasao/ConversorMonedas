//
//  Hacking.swift
//  moneyExchange_Alvaro
//
//  Created by Alvaro Salomoni on 07/11/2018.
//  Copyright © 2018 Alvaro Salomoni. All rights reserved.
//

import UIKit
import Foundation

class Hacking :UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    @IBOutlet weak var inpHack: UITextField!
    @IBOutlet weak var btnHack: UIButton!
    @IBOutlet weak var pickerHack: UIPickerView!
    var contadorHack = 0
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tiposMoneda.count
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return tiposMoneda[row].getNombre()
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(tiposMoneda[row].getNombre())
    }

    
    @IBAction func hackit(_ sender: Any) {
        
        contadorHack = pickerHack.selectedRow(inComponent: 0)
        let monedahack = tiposMoneda[contadorHack]
        
        if inpHack != nil{
            monedahack.setValor(valor: inpHack.text ?? "")
            let alert = UIAlertController(title: "Value Changed", message: "We hope that you know what you do", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Sure", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        
    }
    
    
    
    
}
