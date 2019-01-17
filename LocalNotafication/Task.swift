//
//  Task.swift
//  LocalNotafication
//
//  Created by CodeWell on 1/16/19.
//  Copyright © 2019 Ivana Stamardjioska. All rights reserved.
//

import UIKit

class Task: NSObject {
    var title: String?
    var date: Date?
    
    init(withTitle: String, date:Date){
    
    self.title = withTitle
    self.date = date

    }
}
