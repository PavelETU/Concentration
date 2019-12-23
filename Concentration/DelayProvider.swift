//
//  DelayProvider.swift
//  Concentration
//
//  Created by Pavel Suvit on 20/12/2019.
//  Copyright © 2019 Pavel Suvit. All rights reserved.
//

import Foundation

protocol DelayProvider {
    func runFunctionWithDelay(delayByMilliseconds: Int, function: @escaping () -> Void)
}
