//
//  DetayRouter.swift
//  iOSBitirmeProjesi
//
//  Created by Aykut ATABAY on 11.09.2022.
//

import Foundation
class DetayRouter: PresenterToRouterDetayProtocol {
    static func createModule(ref: DetayViewController) {
        ref.DetayViewPresenterNesne = DetayPresenter()
        ref.DetayViewPresenterNesne?.detayInteractor = DetayInteractor()
    }
}
