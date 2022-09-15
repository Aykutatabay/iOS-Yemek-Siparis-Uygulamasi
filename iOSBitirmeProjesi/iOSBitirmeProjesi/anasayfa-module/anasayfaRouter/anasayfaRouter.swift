//
//  anasayfaRouter.swift
//  iOSBitirmeProjesi
//
//  Created by Aykut ATABAY on 9.09.2022.
//

import Foundation
class anasayfaRouter: PresenterToRouterAnasayfaProtocol{
    //bu bolume bi bak
    static func createModule(ref: ViewController) {
        let presenter = anasayfaPresenter()
        ref.presenterNesne = presenter
        ref.presenterNesne?.interactorAnasayfa = anasayfaInteractor()
        ref.presenterNesne?.viewAnasayfa = ref
        ref.presenterNesne?.interactorAnasayfa?.presenterAnasayfa = presenter
    }
    
    
}
