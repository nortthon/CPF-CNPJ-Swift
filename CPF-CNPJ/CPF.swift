//
//  CPF.swift
//  GeradorCPFValido
//
//  Created by Lucas Augusto on 2014-06-28.
//  Copyright (c) 2014 Lucas Augusto da Silva. All rights reserved.
//

import Foundation

class CPF {
    
    func gerarCPFValido() -> String {
        
        var cpf = [0,0,0,0,0,0,0,0,0,0,0]
        var temp1 = 0,temp2 = 0
        
        for i in 0...8 {
            cpf[i] = (Int)(arc4random_uniform(9))
            temp1 += cpf[i] * (10 - i)
            temp2 += cpf[i] * (11 - i)
        }
        
        temp1 %= 11
        cpf[9] = temp1 < 2 ? 0 : 11-temp1
        
        temp2 += cpf[9] * 2
        temp2 %= 11
        cpf[10] = temp2 < 2 ? 0 : 11-temp2
        
        return "\(cpf[0])\(cpf[1])\(cpf[2]).\(cpf[3])\(cpf[4])\(cpf[5]).\(cpf[6])\(cpf[7])\(cpf[8])-\(cpf[9])\(cpf[10])"
        
    }
    
    func validarCPF(cpf: String) -> Bool {
        
        if countElements(cpf) == 11 {
            
            var d1 = cpf.substringWithRange(Range(start: advance(cpf.startIndex, 9), end: advance(cpf.startIndex, 10))).toInt()!
            var d2 = cpf.substringWithRange(Range(start: advance(cpf.startIndex, 10), end: advance(cpf.startIndex, 11))).toInt()!
            
            var temp1 = 0, temp2 = 0
            
            for i in 0...8 {
                
                var char = cpf.substringWithRange(Range(start: advance(cpf.startIndex, i), end: advance(cpf.startIndex, i+1))).toInt()!
                
                temp1 += char * (10 - i)
                temp2 += char * (11 - i)
            }
            
            temp1 %= 11
            temp1 = temp1 < 2 ? 0 : 11-temp1
            
            temp2 += temp1 * 2
            temp2 %= 11
            temp2 = temp2 < 2 ? 0 : 11-temp2
            
            if temp1 == d1 && temp2 == d2 {
                return true
            }
            
        }
        
        return false
    }
    
}