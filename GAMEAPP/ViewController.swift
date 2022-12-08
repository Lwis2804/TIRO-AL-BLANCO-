//
//  ViewController.swift
//  GAMEAPP
//
//  Created by LUIS GONZALEZ on 30/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var lblMainTitle: UILabel!{
        didSet{ self.lblMainTitle.layer.cornerRadius = 8 }
    }
    @IBOutlet weak var lblValorPorAtinar: UILabel!
    @IBOutlet weak var lblValorAleatorio: UILabel!{
        didSet{ self.lblValorAleatorio.layer.cornerRadius = 15 }
    }
    @IBOutlet weak var lblRecord: UILabel!
    @IBOutlet weak var btnReiniciar: UIButton!{
        didSet{ self.btnReiniciar.layer.cornerRadius = 8 }
    }
    @IBOutlet weak var sliderTiro: UISlider!
    @IBOutlet weak var btnDispara: UIButton!{
        didSet{ self.btnDispara.layer.cornerRadius = 8 }
    }
    @IBOutlet weak var lblPuntuacion: UILabel!
    @IBOutlet weak var lblMarcadorPuntuacion: UILabel!
    @IBOutlet weak var lblRonda: UILabel!
    
    @IBOutlet weak var lblNoRonda: UILabel!
    
    @IBOutlet weak var btnSiguienteRonda: UIButton!{
        didSet{ self.btnSiguienteRonda.layer.cornerRadius = 8 }
    }
    // V A R I A B L E S

    var randomValue : Int = 0
    var rondas: Int = 0
    var pointNumber: Int = 0
    var sliderValue: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.randomValue = self.generateRandomValue()
        self.lblValorAleatorio.text = String(randomValue)
        self.setUpSlider()
    }
    
    func generateRandomValue () -> Int {
       return Int(arc4random_uniform(100))
    }
    
    func setUpSlider (){
        self.sliderTiro.minimumValue = 0
        self.sliderTiro.maximumValue = 100
        self.sliderTiro.value = 50
        self.sliderTiro.setThumbImage(UIImage(named: "SliderThumb-Normal"), for: .normal)
        self.lblMarcadorPuntuacion.text = "\(pointNumber)"
        self.lblNoRonda.text = "\(rondas)"
    }
    
    @IBAction func getSlideNumber(_ sender: Any) {
        self.sliderValue = Int(self.sliderTiro.value)
    }
    
    
    @IBAction func btnDispara(_ sender: Any) {
        self.valida(valor1: randomValue, valor2: sliderValue)
        self.lblMarcadorPuntuacion.text = "\(pointNumber)"
        self.rondas += 1
        self.lblNoRonda.text = "\(rondas)"
        self.btnDispara.isHidden = true
    }

    
    
    func valida(valor1 num1: Int, valor2 num2 : Int){
        let val = abs(num1-num2)
        if val == 0 {
            print("ganaste 100 puntos")
            self.pointNumber += 100
        } else if val <= 5 {
            print("Ganaste 10 puntos")
            self.pointNumber += 10
        } else if val <= 10 {
            print("No ganas puntos")
        } else {
            print("No pues no compa")
        }
    }
    
    @IBAction func btnSiguienteRonda(_ sender: Any) {
        self.randomValue = self.generateRandomValue()
        self.lblValorAleatorio.text = String(randomValue)
        self.setUpSlider()
        self.btnDispara.isHidden = false
        if lblNoRonda.text == "3" {
            btnSiguienteRonda.isHidden = true
        }
        if lblNoRonda.text == "3" {
            btnDispara.isHidden = true
        }
    }
    
    @IBAction func btnReiniciarJuego(_ sender: Any) {
        self.randomValue = self.generateRandomValue()
        self.lblValorAleatorio.text = String(randomValue)
        self.setUpSlider()
        btnSiguienteRonda.isHidden = false
        btnDispara.isHidden = false
    }
    
}




