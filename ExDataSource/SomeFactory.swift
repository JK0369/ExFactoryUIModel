//
//  SomeFactory.swift
//  ExDataSource
//
//  Created by 김종권 on 2024/03/09.
//

import Foundation

enum SomeFactory {
    static func makeFirstUIModel(apiResponse: [Int]) -> [Model] {
        apiResponse
            .map {
                .init(n: String($0) + "번째")
            }
    }
}
