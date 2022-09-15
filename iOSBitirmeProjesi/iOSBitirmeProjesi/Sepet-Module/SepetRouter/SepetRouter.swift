//
//  SepetRouter.swift
//  iOSBitirmeProjesi
//
//  Created by Aykut ATABAY on 13.09.2022.
//

import Foundation
class SepetRouter: PresenterToRouterSepetProtocol {
    static func createModule(ref: SepetViewController) {
        let presenterSep = SepetPresenter()
        ref.SepetPresenterNesne = presenterSep
        ref.SepetPresenterNesne?.sepetInteractor = SepetInteractor()
        ref.SepetPresenterNesne?.sepetView = ref
        ref.SepetPresenterNesne?.sepetInteractor?.presenterSepet = presenterSep
    }
}
