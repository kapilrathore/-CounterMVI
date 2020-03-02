//
//  ViewController.swift
//  MVICounter
//
//  Created by kapilrathore-mbp on 27/02/20.
//  Copyright © 2020 Kapil Rathore. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var incrementButton: UIButton!
    @IBOutlet private weak var decrementButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet private weak var intervalStepper: UIStepper!
    @IBOutlet private weak var intervalLabel: UILabel!
    
    private lazy var intentions: CounterIntentions = {
        return CounterIntentions(
            incrementButton.rx.tap.asObservable(),
            decrementButton.rx.tap.asObservable(),
            resetButton.rx.tap.asObservable(),
            intervalStepper.rx.value.asObservable()
        )
    }()
    private let states = BehaviorSubject(value: CounterState(count: 0, interval: 1))
    private let counterModel = CounterModel()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        intervalStepper.minimumValue = 1.0
        intervalStepper.stepValue = 1.0
        intervalStepper.maximumValue = 5.0
        
        counterModel
            .bindModel(intentions, states)
            .subscribe(onNext: { [weak self] state in
                print("HIT - ", state)
                self?.states.onNext(state)
                self?.render(state)
            })
            .disposed(by: disposeBag)
    }
}

extension ViewController: CounterView {
    func updateCountLabel(with value: Int) {
        counterLabel.text = "\(value)"
    }
    
    func updateIntervalLabel(with value: Int) {
        intervalLabel.text = "Interval = \(value)"
    }
}
