//
//  AsyncAfterDelayProvider.swift
//  Concentration
//
//  Created by Pavel Suvit on 20/12/2019.
//  Copyright © 2019 Pavel Suvit. All rights reserved.
//

import Foundation

struct AsyncAfterDelayProvider: DelayProvider {
    func runFunctionWithDelay(delayBy: Float, function: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7, execute: function)
    }
}
