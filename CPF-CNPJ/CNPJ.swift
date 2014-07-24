//
//  CNPJ.swift
//  cnpj-CNPJ
//
//  Created by Lucas Augusto on 2014-07-23.
//  Copyright (c) 2014 Lucas Augusto da Silva. All rights reserved.
//

import Foundation

class CNPJ {
    
    func gerarCNPJValido() -> String {
        
        var cnpj = [0,0,0,0,0,0,0,0,0,0,0,1,0,0]
        var temp1 = 2, temp2 = 3
        var baseDig1 = 5, baseDig2 = 6
        
        for i in 0...7 {
            cnpj[i] = (Int)(arc4random_uniform(9))
            temp1 += cnpj[i] * baseDig1
            temp2 += cnpj[i] * baseDig2
            
            baseDig1 = baseDig1 == 2 ? 9 : baseDig1-1
            baseDig2 = baseDig2 == 2 ? 9 : baseDig2-1
        }
        
        temp1 %= 11
        cnpj[12] = temp1 < 2 ? 0 : 11-temp1
        
        temp2 += cnpj[9] * 2
        temp2 %= 11
        cnpj[13] = temp2 < 2 ? 0 : 11-temp2
        
        return "\(cnpj[0])\(cnpj[1]).\(cnpj[2])\(cnpj[3])\(cnpj[4]).\(cnpj[5])\(cnpj[6])\(cnpj[7])/\(cnpj[8])\(cnpj[9])\(cnpj[10])\(cnpj[11])-\(cnpj[12])\(cnpj[13])"
    }
    
}