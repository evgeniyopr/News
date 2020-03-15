//
//  String+Date.swift
//  News
//
//  Created by Evgeniy Opryshko on 14.03.2020.
//  Copyright © 2020 Evgeniy Opryshko. All rights reserved.
//

import Foundation

extension Date {
	
    func toString(dateFormat format: String ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
