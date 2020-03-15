//
//  ViewController+Alert.swift
//  News
//
//  Created by Evgeniy Opryshko on 14.03.2020.
//  Copyright © 2020 Evgeniy Opryshko. All rights reserved.
//

import UIKit

extension UIViewController {
	
	func showAlert(alertText : String, alertMessage : String) {
		
		let alert = UIAlertController(title: alertText, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
		alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
		
		self.present(alert, animated: true, completion: nil)
	}
}
