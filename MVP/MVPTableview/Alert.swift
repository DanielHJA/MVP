//
//  Alert.swift
//  MVPDEBUG
//
//  Created by Daniel Hjärtström on 2020-01-13.
//  Copyright © 2020 Daniel Hjärtström. All rights reserved.
//

import UIKit

enum Status {
    case approved, declined
}

class Alert {

    class func alertWithCompletion(presentingViewController: UIViewController, title: String, message: String, completion: @escaping (Status) -> Void) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "Ok", style: .default) { (_) in
            completion(.approved)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
            completion(.declined)
        }
        controller.addActions([okAction, cancelAction])
        presentingViewController.present(controller, animated: true, completion: nil)
    }
    
}

extension UIAlertController {
    func addActions(_ actions: [UIAlertAction]) {
        for action in actions {
            self.addAction(action)
        }
    }
}
