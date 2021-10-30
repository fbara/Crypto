//
//  String.swift
//  Crypto
//
//  Created by Frank Bara on 10/30/21.
//

import Foundation

extension String {
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
}
