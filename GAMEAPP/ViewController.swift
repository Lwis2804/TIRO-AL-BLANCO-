//
//  ViewController.swift
//  GAMEAPP
//
//  Created by LUIS GONZALEZ on 30/11/22.
//

import UIKit

class ViewController: UIViewController {

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
    @IBOutlet weak var lblNoRonda: UIImageView!
    @IBOutlet weak var btnSiguienteRonda: UIButton!{
        didSet{ self.btnSiguienteRonda.layer.cornerRadius = 8 }
    }
    // V A R I A B L E S

    var randomValue : Int = 0
    var rondas = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.randomValue = self.generateRandomValue()
        self.lblValorAleatorio.text = String(randomValue)
    }
    
    func generateRandomValue () -> Int {
       return Int(arc4random_uniform(100))
    }
    
    func setUpSlider (){
        
    }
}




