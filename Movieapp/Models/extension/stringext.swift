//
//  stringext.swift
//  Movieapp
//
//  Created by noor alotibi on 02/08/1445 AH.
//

import Foundation
extension String {
    var isEmptyOrWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
