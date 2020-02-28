//
//  CounterView.swift
//  MVICounter
//
//  Created by kapilrathore-mbp on 27/02/20.
//  Copyright © 2020 Kapil Rathore. All rights reserved.
//

import Foundation

protocol CounterView {
    func render(_ state: CounterState)
    
    func updateCountLabel(with value: Int)
    func updateIntervalLabel(with value: Int)
}

extension CounterView {
    func render(_ state: CounterState) {
        updateCountLabel(with: state.count)
        updateIntervalLabel(with: state.interval)
    }
}
