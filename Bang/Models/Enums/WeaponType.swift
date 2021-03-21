//
//  Weapon.swift
//  Bang
//
//  Created by Kocka Dominik on 2021. 03. 21..
//

import Foundation

/// Represents all available weapon types
enum WeaponType: String {
    case colt = "Colt .45"
    case carabine = "Karabély"
    case rapidFire = "Gyorstüzelő"
    case remington = "Remington"
    case schofield = "Schofield"
    case winchester = "Winchester"
    
    /// The firepower of the weapon
    var firePower: Int {
            switch self {
            case .colt:
                return 1
            case .carabine:
                return 4
            case .rapidFire:
                return 1
            case .remington:
                return 3
            case .schofield:
                return 2
            case .winchester:
                return 5
            }
        }
}
