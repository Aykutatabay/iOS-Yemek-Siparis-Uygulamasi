//
//  SepetPresenter.swift
//  iOSBitirmeProjesi
//
//  Created by Aykut ATABAY on 13.09.2022.
//

import Foundation
class SepetPresenter: ViewToPresenterSepetProtocol {
    var sepetView: PresenterToViewSepetProtocol?
    var sepetInteractor: PresenterToInteractorSepetProtocol?
    
    func yemekSil(sepet_yemek_id: Int, kullanici_adi: String) {
        sepetInteractor?.sepetYemekSil(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
    
    func yemekAl(kullanici_adi: String) {
        sepetInteractor?.sepetYemekAl(kullanici_adi: kullanici_adi)
    }
}

extension SepetPresenter: InteractortoPresenterSepetProtocol {
    func SepetPresenteraVeriGonder(sepettekiYemekListe: Array<sepet_yemekler>) {
        sepetView?.SepetViewaVeriGonder(sepettekiYemekListe: sepettekiYemekListe)
    }
}
