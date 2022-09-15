//
//  SepetProtocols.swift
//  iOSBitirmeProjesi
//
//  Created by Aykut ATABAY on 13.09.2022.
//

import Foundation
protocol ViewToPresenterSepetProtocol {
    var sepetInteractor: PresenterToInteractorSepetProtocol? { get set }
    var sepetView: PresenterToViewSepetProtocol? { get set }
    func yemekAl(kullanici_adi: String)
    func yemekSil(sepet_yemek_id:Int, kullanici_adi:String)
}

protocol PresenterToInteractorSepetProtocol {
    var presenterSepet: InteractortoPresenterSepetProtocol? { get set }
    func sepetYemekAl(kullanici_adi: String)
    func sepetYemekSil(sepet_yemek_id:Int, kullanici_adi:String)
    
}

protocol PresenterToRouterSepetProtocol {
    static func createModule(ref:SepetViewController)
    
}

protocol InteractortoPresenterSepetProtocol {
    func SepetPresenteraVeriGonder(sepettekiYemekListe: Array<sepet_yemekler>)
}

protocol PresenterToViewSepetProtocol {
    func SepetViewaVeriGonder(sepettekiYemekListe: Array<sepet_yemekler>)
    
}
