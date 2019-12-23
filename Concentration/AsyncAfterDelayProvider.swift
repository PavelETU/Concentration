//
//  AsyncAfterDelayProvider.swift
//  Concentration
//
//  Created by Pavel Suvit on 20/12/2019.
//  Copyright © 2019 Pavel Suvit. All rights reserved.
//

import Foundation

struct AsyncAfterDelayProvider: DelayProvider {
    func runFunctionWithDelay(delayByMilliseconds: Int, function: @escaping () -> Void) {
        let dispatchTimeToDelayBy = DispatchTimeInterval.milliseconds(Int(delayByMilliseconds))
        DispatchQueue.main.asyncAfter(deadline: .now() + dispatchTimeToDelayBy, execute: function)
    }
}
