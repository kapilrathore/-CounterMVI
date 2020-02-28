//
//  CounterState.swift
//  MVICounter
//
//  Created by kapilrathore-mbp on 27/02/20.
//  Copyright © 2020 Kapil Rathore. All rights reserved.
//

import Foundation

struct CounterState: Equatable {
    let count: Int
    let interval: Int
}

extension CounterState {
    func copy(
        count: Int? = nil,
        interval: Int? = nil
    ) -> CounterState {
        return CounterState(
            count: count ?? self.count,
            interval: interval ?? self.interval
        )
    }
}
