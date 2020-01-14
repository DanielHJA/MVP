//
//  Animal.swift
//  MVP
//
//  Created by Daniel Hjärtström on 2020-01-13.
//  Copyright © 2020 Daniel Hjärtström. All rights reserved.
//

import UIKit

struct Animal: Decodable {

    var name: String
    var age: Int
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case age = "age"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        age = try container.decode(Int.self, forKey: .age)
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
}
