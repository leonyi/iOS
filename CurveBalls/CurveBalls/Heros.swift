//
//  Heros.swift
//  CurveBalls
//
//  Created by Yanet Leon on 1/25/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import Foundation

class Hero {
    var name: String
    var world: String
    var nemesis: String
    var selectedChoice: String
    var swipeAction: String
    
    init(name: String, world: String, nemesis: String, selected: String, action: String) {
        self.name = name
        self.world = world
        self.nemesis = nemesis
        self.selectedChoice = selected
        self.swipeAction = action
    }
}
