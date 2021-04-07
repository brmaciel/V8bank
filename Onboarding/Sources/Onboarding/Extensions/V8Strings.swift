//
//  V8Strings.swift
//  
//
//  Created by Bruno Maciel on 4/7/21.
//

import Foundation

extension String {
    func at(_ i: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: i)]
    }
}
