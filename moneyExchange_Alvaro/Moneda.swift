//
//  File.swift
//  moneyExchange_Alvaro
//
//  Created by Alvaro Salomoni on 31/10/2018.
//  Copyright © 2018 Alvaro Salomoni. All rights reserved.
//

import Foundation
import UIKit

extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let x = pow(10.0, Double(places))
        return (self * x).rounded() / x
    }
}

class Moneda{
    
    var nombre : String?
    var valor : String?
    var bandera: UIImage
    var fondo: UIImage
    var simbolo : String?
    var error: String = "No se puede convertir la moneda"
    
    
    
    init(nombre:String, valor:String, bandera:UIImage, fondo: UIImage,simbolo : String) {
        self.nombre = nombre
        self.valor = valor
        self.bandera = bandera
        self.fondo = fondo
        self.simbolo = simbolo
    }
    func getValor() -> String{
        return (valor ?? nil)!
    }
    func getNombre() -> String{
        return (nombre ?? nil)!
    }
    func getBandera() -> UIImage{
        return bandera
    }
    func getFondo() -> UIImage{
        return fondo
    }
    func getSimbolo() -> String{
        return (simbolo ?? nil)!
    }
    func setValor(valor:String){
        self.valor = valor
    }
    func setNombre(nombre:String){
        self.nombre = nombre
    }
    func setBandera(bandera:UIImage){
        self.bandera = bandera
    }
    func setFondo(fondo:UIImage){
        self.fondo = fondo
    }
    func setSimbolo(simbolo:String){
        self.simbolo = simbolo
    }
    
    func convertir(m1:Moneda, m2:Moneda, cantidad:Double) -> Double{
        let moneda1:String = m1.getNombre()
        let moneda2:String = m2.getNombre()
        
        if moneda1 == "Dolares"{
            if moneda2 == "Dolares"{
                print("\(error)")
            }
            if moneda2 == "Euros"{
                let a = (cantidad*0.88).rounded(toPlaces: 2)
                return a
            }
            if moneda2 == "Libras"{
                let a = (cantidad*0.77).rounded(toPlaces: 2)
                return a
            }
            if moneda2 == "Rupias"{
                let a = (cantidad*72.68).rounded(toPlaces: 2)
                return a
            }
            if moneda2 == "Yen"{
                let a = (cantidad*113.21).rounded(toPlaces: 2)
                return a
            }
        }
        //Cambiar valores a partir de aqui
        if moneda1 == "Euros"{
            if moneda2 == "Euros"{
                print("\(error)")
            }
            if moneda2 == "Dolares"{
                let a = (cantidad*1.14).rounded(toPlaces: 2)
                return a
            }
            if moneda2 == "Libras"{
                let a = (cantidad*0.87).rounded(toPlaces: 2)
                return a
            }
            if moneda2 == "Rupias"{
                let a = (cantidad*82.80).rounded(toPlaces: 2)
                return a
            }
            if moneda2 == "Yen"{
                let a = (cantidad*128.98).rounded(toPlaces: 2)
                return a
            }
        }
        //Cambiar variables a partir de aqui
        if moneda1 == "Libras"{
            if moneda2 == "Libras"{
                print("\(error)")
            }
            if moneda2 == "Dolares"{
                let a = (cantidad*1.30).rounded(toPlaces: 2)
                return a
            }
            if moneda2 == "Euros"{
                let a = (cantidad*1.14).rounded(toPlaces: 2)
                return a
            }
            if moneda2 == "Rupias"{
                let a = (cantidad*94.58).rounded(toPlaces: 2)
                return a
            }
            if moneda2 == "Yen"{
                let a = (cantidad*147.32).rounded(toPlaces: 2)
                return a
            }
        }
        //Cambiar variables a partir de aqui
        if moneda1 == "Rupias"{
            if moneda2 == "Rupias"{
                print("\(error)")
            }
            if moneda2 == "Dolares"{
                let a = (cantidad*0.013).rounded(toPlaces: 2)
                return a
            }
            if moneda2 == "Libras"{
                let a = (cantidad*0.010).rounded(toPlaces: 2)
                return a
            }
            if moneda2 == "Euros"{
                let a = (cantidad*0.012).rounded(toPlaces: 2)
                return a
            }
            if moneda2 == "Yen"{
                let a = (cantidad*1.55).rounded(toPlaces: 2)
                return a
            }
        }
        //Cambiar variables a partir de aqui
        if moneda1 == "Yen"{
            if moneda2 == "Yen"{
                print("\(error)")
            }
            if moneda2 == "Dolares"{
                let a = (cantidad*0.0088).rounded(toPlaces: 2)
                return a
            }
            if moneda2 == "Libras"{
                let a = (cantidad*0.00679).rounded(toPlaces: 2)
                return a
            }
            if moneda2 == "Rupias"{
                let a = (cantidad*0.64195).rounded(toPlaces: 2)
                return a
            }
            if moneda2 == "Euro"{
                let a = (cantidad*0.00775).rounded(toPlaces: 2)
                return a
            }
        }
       
        return 0
    }
    
}
