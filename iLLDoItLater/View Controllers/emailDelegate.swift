//
//  emailDelegate.swift
//  iLLDoItLater
//
//  Created by West Kraemer on 5/22/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import Foundation

protocol EmailTitleAndDetailDelegate {
    func sendEmailVCTitleAndDetail(_ emailTitle: String, _ emailDetail: String)
}
