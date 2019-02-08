//
//  ViewController.swift
//  moneyExchange_Alvaro
//
//  Created by Alvaro Salomoni on 30/10/2018.
//  Copyright © 2018 Alvaro Salomoni. All rights reserved.
//

import UIKit

extension String {
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}

let mon1 = Moneda(nombre: "Dolares", valor: "0.88", bandera: UIImage.init(named: "USA")!, fondo: UIImage.init(named: "edUSA")!, simbolo: "$")
let mon2 = Moneda(nombre: "Euros", valor: "1", bandera: UIImage.init(named: "Europe")!, fondo: UIImage.init(named: "edEu")!, simbolo: "€")
let mon3 = Moneda(nombre: "Libras", valor: "0.77", bandera: UIImage.init(named: "Gb")!, fondo: UIImage.init(named: "edGB")!, simbolo: "£")
let mon4 = Moneda(nombre: "Rupias", valor: "72.90", bandera: UIImage.init(named: "India")!, fondo: UIImage.init(named: "edIndia")!, simbolo: "₹")
let mon5 = Moneda(nombre: "Yen", valor: "113.21", bandera: UIImage.init(named: "Jp")!, fondo: UIImage.init(named: "edJP")!, simbolo: "¥")

var tiposMoneda = [Moneda]()
var counter = 0



class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var numeroMoneda: UITextField!
    @IBOutlet weak var Monedas: UIPickerView!
    @IBOutlet weak var btnConvert: UIButton!
    @IBOutlet weak var lblConversion: UILabel!
    @IBOutlet weak var flagPic: UIImageView!
    @IBOutlet weak var nombreMoneda: UILabel!
    @IBOutlet weak var lblMoneda: UILabel!
    @IBOutlet weak var Next: UIButton!
    @IBOutlet weak var before: UIButton!
    @IBOutlet weak var btnHack: UIButton!
    @IBOutlet weak var nombreConversion: UILabel!
    @IBOutlet weak var background: UIImageView!
    

    var pickerMoneda: String = ""
    var dinero = 0
    var dinero2 = 0
    var conversion = 0;
    let hola = 0;
    var contador = 0
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tiposMoneda.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tiposMoneda[row].getNombre()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(tiposMoneda[row].getNombre())
    }
    /* Funcion para las banderas en el nombre del picker, no funciona
     func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var myImageView = UIImageView()
        
        switch row {
        case 0:
            myImageView = UIImageView(image: UIImage(named:"USA"))
        case 1:
            myImageView = UIImageView(image: UIImage(named:"Europe"))
        case 2:
            myImageView = UIImageView(image: UIImage(named:"GB"))
        case 3:
            myImageView = UIImageView(image: UIImage(named:"India"))
        case 4:
            myImageView = UIImageView(image: UIImage(named:"Jp"))
        default:
            myImageView.image = nil
            return myImageView
        }
        return myImageView
    }*/
    
    @IBAction func btnConvertir(_ sender: Any) {
        dinero = Monedas.selectedRow(inComponent: 0)
        dinero2 = Monedas.selectedRow(inComponent: 1)
        let monedas1 = tiposMoneda[dinero]
        let monedas2 = tiposMoneda[dinero2]
        nombreConversion.text = "De \(monedas1.getNombre()) a \(monedas2.getNombre())"
        if numeroMoneda.text == "999" {
            let alert = UIAlertController(title: "You just entered Hack mode", message: "You're allowed to change values", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            btnHack.isHidden = false
        }
        if numeroMoneda.text == nil{
            nombreConversion.text = "Introduce algun valor"
        }
        else {
            let stringCantidad:String = numeroMoneda.text ?? ""
            let cantidad:Double = stringCantidad.toDouble() ?? 0
            let valorFinal:String = String(monedas1.convertir(m1: monedas1, m2: monedas2, cantidad: cantidad))
            lblConversion.text = ("\(valorFinal) \(monedas2.getSimbolo())")
        }
        
        
    }

    
    @IBAction func paratras(_ sender: Any) {
        contador = contador - 1
        Next.isHidden = false
        if contador <= 0 {
            before.isHidden = true
            background.image = tiposMoneda[contador].getFondo()
            flagPic.image = tiposMoneda[contador].getBandera()
            nombreMoneda.text = tiposMoneda[contador].getNombre()
            lblMoneda.text = ("\(tiposMoneda[contador].getValor())")
        }
        else{
            before.isHidden = false
            background.image = tiposMoneda[contador].getFondo()
            flagPic.image = tiposMoneda[contador].getBandera()
            nombreMoneda.text = tiposMoneda[contador].getNombre()
            lblMoneda.text = ("\(tiposMoneda[contador].getValor())")
        }
        
    }
    @IBAction func paradelante(_ sender: Any) {
        contador = contador + 1
        before.isHidden = false
        if contador >= 4{
            Next.isHidden = true
            background.image = tiposMoneda[contador].getFondo()
            flagPic.image = tiposMoneda[contador].getBandera()
            nombreMoneda.text = tiposMoneda[contador].getNombre()
            lblMoneda.text = ("\(tiposMoneda[contador].getValor())")
        }
        else{
            Next.isHidden = false
            background.image = tiposMoneda[contador].getFondo()
            flagPic.image = tiposMoneda[contador].getBandera()
            nombreMoneda.text = tiposMoneda[contador].getNombre()
            lblMoneda.text = ("\(tiposMoneda[contador].getValor())")
            
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        btnHack.isHidden = true
        before.isHidden = true
        if tiposMoneda.count == 0{
            tiposMoneda.append(mon1)
            tiposMoneda.append(mon2)
            tiposMoneda.append(mon3)
            tiposMoneda.append(mon4)
            tiposMoneda.append(mon5)
        }
        flagPic.image = tiposMoneda[contador].getBandera()
        nombreMoneda.text = tiposMoneda[contador].getNombre()
        lblMoneda.text = tiposMoneda[contador].getValor()
        background.image = tiposMoneda[contador].getFondo()
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: "Enabled")
        let enabled = defaults.bool(forKey: "Enabled")
        
    }


}

