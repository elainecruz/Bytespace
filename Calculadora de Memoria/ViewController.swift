//
//  ViewController.swift
//  Calculadora de Memoria
//
//  Created by Elaine Cruz Farias on 02/03/20.
//  Copyright © 2020 Elaine Cruz Farias. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if row==0{
            return "KB"
        }else if row==1{
            return "MB"
        }else{
            return "GB"
        }
    }
    
    
    @IBOutlet var memoryTextField: UITextField!
    
    @IBOutlet var viewPrincipal: UIView!
    @IBOutlet var buttonMG: UIButton!
    @IBOutlet var buttonKB: UIButton!
    @IBOutlet var buttonGB: UIButton!
    @IBOutlet var viewResult: UIView!
    @IBOutlet var result: UILabel!
    
    @IBOutlet var selectedMB: UIImageView!
    @IBOutlet var selectedKB: UIImageView!
    @IBOutlet var selectedGB: UIImageView!
    @IBOutlet var buttonCalcular: UIButton!
    
    @IBOutlet var sizePicker: UIPickerView!
    
    var unidade: Int = -1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.apagar))
        
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
        sizePicker.isHidden = true
        sizePicker.dataSource = self
        sizePicker.delegate = self
    }
    
    @objc func apagar(){
        view.endEditing(true)
    }
    
    @IBAction func ClicarEmKB(){
        unidade = 0
        selectedKB.isHidden = false
        selectedMB.isHidden = true
        selectedGB.isHidden = true
    }
    
    @IBAction func clicarEmMB(_ sender: Any) {
        unidade = 1
        //buttonMG.backgroundColor = UIColor(red: 205, green: 138, blue: 162, alpha: 0.5)
        selectedKB.isHidden = true
        selectedMB.isHidden = false
        selectedGB.isHidden = true
        
    }
    
    @IBAction func clicarEmGB(_ sender: Any) {
        unidade = 2
        selectedKB.isHidden = true
        selectedMB.isHidden = true
        selectedGB.isHidden = false
    }
    
    
    @IBAction func clicarEmCalcular(_ sender: Any) {
        if (!memoryTextField.text!.isEmpty){
            calcularFotos(unidade: unidade)
            viewResult.isHidden = false
            buttonCalcular.setTitle("Recalcular", for: .normal)
        }
    }
    
    func calcularFotos(unidade:Int){
        let qtdMemoria = memoryTextField.text!
        let qtdMemoriaInt = Float(qtdMemoria)!
        
        if(unidade==0){
            result.text = String(Int((qtdMemoriaInt*0.001)/2))
            
        }else if(unidade==1){
            result.text = String(Int(qtdMemoriaInt/2))
            
        }else if(unidade==2){
            result.text = String(Int((qtdMemoriaInt*1000)/2))
            
        }
        
    }
    
}

