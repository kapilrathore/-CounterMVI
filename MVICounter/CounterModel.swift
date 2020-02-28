//
//  CounterModel.swift
//  MVICounter
//
//  Created by kapilrathore-mbp on 27/02/20.
//  Copyright © 2020 Kapil Rathore. All rights reserved.
//

import RxSwift

class CounterModel {
    func bindModel(
        _ intentions: CounterIntentions,
        _ states: Observable<CounterState>
    ) -> Observable<CounterState> {
        
        let incrementStates = incrementUsecase(intentions, states)
        let decrementStates = decrementUsecase(intentions, states)
        let resetStates = resetUsecase(intentions, states)
        let intervalChangeStates = intervalChangeUsecase(intentions, states)
        
        return Observable.merge(
            incrementStates,
            decrementStates,
            resetStates,
            intervalChangeStates
        )
    }
    
    func incrementUsecase(
        _ intention: CounterIntentions,
        _ states: Observable<CounterState>
    ) -> Observable<CounterState> {
        return intention.incrementIntention
            .withLatestFrom(states)
            .map { state -> CounterState in
                state.copy(count: state.count + state.interval)
            }
    }
    
    func decrementUsecase(
        _ intention: CounterIntentions,
        _ states: Observable<CounterState>
    ) -> Observable<CounterState> {
        return intention.decrementIntention
            .withLatestFrom(states)
            .map { state -> CounterState in
                state.copy(count: state.count - state.interval)
            }
    }
    
    func resetUsecase(
        _ intention: CounterIntentions,
        _ states: Observable<CounterState>
    ) -> Observable<CounterState> {
        return intention.resetIntention
            .withLatestFrom(states)
            .map { state -> CounterState in
                state.copy(count: 0)
            }
    }
    
    func intervalChangeUsecase(
        _ intention: CounterIntentions,
        _ states: Observable<CounterState>
    ) -> Observable<CounterState> {
        return intention.intervalChangeIntention
            .withLatestFrom(states) { newInterval, state -> CounterState in
                return state.copy(interval: Int(newInterval))
            }
    }
}
