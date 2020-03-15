//
//  ViewController+Navigation.swift
//  News
//
//  Created by Evgeniy Opryshko on 14.03.2020.
//  Copyright © 2020 Evgeniy Opryshko. All rights reserved.
//

import UIKit

extension UIViewController {
	
	func show(_ viewController: UIViewController, animated: Bool = true) {
		navigationController?.pushViewController(viewController, animated: animated)
	}
	
}
