//
//  Webservice.swift
//  MVP
//
//  Created by Daniel Hjärtström on 2020-01-13.
//  Copyright © 2020 Daniel Hjärtström. All rights reserved.
//

import UIKit

class Webservice<T: Decodable> {
    
    class func fetch(completion: @escaping ([Animal]) -> Void) {
        completion([
            Animal(name: "Giraffe", age: 22),
            Animal(name: "Giraffe", age: 22),
            Animal(name: "Giraffe", age: 22),
            Animal(name: "Giraffe", age: 22),
            Animal(name: "Giraffe", age: 22),
            Animal(name: "Giraffe", age: 22),
            Animal(name: "Giraffe", age: 22),
        ])
    }

}
