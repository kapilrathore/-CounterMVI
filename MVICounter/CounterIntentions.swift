//
//  CounterIntentions.swift
//  MVICounter
//
//  Created by kapilrathore-mbp on 27/02/20.
//  Copyright © 2020 Kapil Rathore. All rights reserved.
//

import RxSwift

class CounterIntentions {
    let incrementIntention: Observable<Void>
    let decrementIntention: Observable<Void>
    let resetIntention: Observable<Void>
    let intervalChangeIntention: Observable<Double>
    
    init(
        _ incrementIntention: Observable<Void>,
        _ decrementIntention: Observable<Void>,
        _ resetIntention: Observable<Void>,
        _ intervalChangeIntention: Observable<Double>
    ) {
        self.incrementIntention = incrementIntention
        self.decrementIntention = decrementIntention
        self.resetIntention = resetIntention
        self.intervalChangeIntention = intervalChangeIntention
    }
}
