//
//  CarStructs.swift
//  CarTable
//
//  Created by Cord Stojeba on 4/17/17.
//  Copyright © 2017 Cord N Stojeba. All rights reserved.
//

import Foundation

struct Car{
    var name: String
    var model: String
    var year: Int32
    var make: String
    
    init(name:String, model: String, year: Int32, make: String){
        self.name = name
        self.model = model
        self.year = year
        self.make = make
    
}

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
