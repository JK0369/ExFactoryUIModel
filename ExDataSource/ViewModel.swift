//
//  ViewModel.swift
//  ExDataSource
//
//  Created by 김종권 on 2023/05/25.
//

import RxSwift
import RxCocoa

enum State {
    case updateUI
}

final class ViewModel: ViewModelable {
    private let disposeBag = DisposeBag()
    
    // MARK: State
    var dataSource = [Model]()
    
    // MARK: Output
    var output: RxSwift.Observable<State> {
        outputSubject
    }
    private var outputSubject = PublishSubject<State>()
    
    // MARK: Input
    func input(_ action: Action) {
        switch action {
        case .viewDidLoad:
            requestAPI()
                .subscribe { [weak self] data in
                    self?.dataSource = data
                        .map { Model(n: String($0)) }
                    self?.outputSubject.onNext(.updateUI)
                }
                .disposed(by: disposeBag)
        case let .didSelect(row):
            print("some handling when tap row...")
        }
    }
    
    func requestAPI() -> Single<[Int]> {
        .just((1...10).map { $0 })
    }
}
