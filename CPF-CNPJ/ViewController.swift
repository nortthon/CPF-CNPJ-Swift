//
//  ViewController.swift
//  CPF-CNPJ
//
//  Created by Lucas Augusto on 2014-07-01.
//  Copyright (c) 2014 Lucas Augusto da Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    let cpf = CPF()
    let cnpj = CNPJ()
    
    @IBOutlet var cpfLabel: UILabel!
    @IBOutlet var cnpjLabel: UILabel!
    @IBOutlet var cpfField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func gerarCPFValido() {
        
        cpfLabel.text = cpf.gerarCPFValido()
        
        cpfField.resignFirstResponder()
        
    }
    
    @IBAction func gerarCNPJValido() {
        
        cnpjLabel.text = cnpj.gerarCNPJValido()
        
        cpfField.resignFirstResponder()
    
    }
    
    @IBAction func validarCPF() {
        cpfField.resignFirstResponder()
        if cpf.validarCPF(cpfField.text) {
            alert("CPF válido", style: .Success)
        } else {
            alert("O CPF informado é inválido", style: .Error)
        }
    }
    
    func alert (message: String) {
        let alert = UIAlertView()
        alert.title = "Alerta"
        alert.message = message
        alert.addButtonWithTitle("OK")
        alert.show()
    }
    
    func alert(message: String, style: SCLAlertViewStyle) {
        SCLAlertView().showTitle(
            self,
            title: "Mensagem",
            subTitle: message,
            duration: 10,
            completeText: "Fechar",
            style: style
        )
    }

}

