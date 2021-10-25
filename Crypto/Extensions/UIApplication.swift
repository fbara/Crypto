//
//  UIApplication.swift
//  Crypto
//
//  Created by Frank Bara on 10/25/21.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
