//
//  DevilWizard.swift
//  rpgoop
//
//  Created by Ellen Shin on 5/12/16.
//  Copyright © 2016 Ellen Shin. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    
    override var loot: [String] {
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
}