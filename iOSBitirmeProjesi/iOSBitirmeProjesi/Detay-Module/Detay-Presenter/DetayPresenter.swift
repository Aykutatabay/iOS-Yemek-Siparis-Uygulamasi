//
//  DetayPresenter.swift
//  iOSBitirmeProjesi
//
//  Created by Aykut ATABAY on 11.09.2022.
//

import Foundation
class DetayPresenter: ViewToPresenterDetayProtocol {
    var detayInteractor: PresenterToInteractorDetayProtocol?
    
    func sepeteEkle(yemek_adi: String,
                    yemek_resim_adi: String,
                    yemek_fiyat: Int,
                    yemek_siparis_adet: Int,
                    kullanici_adi: String) {
        detayInteractor?.sepeteYemekEkle(
            yemek_adi: yemek_adi,
            yemek_resim_adi: yemek_resim_adi,
            yemek_fiyat: yemek_fiyat,
            yemek_siparis_adet: yemek_siparis_adet,
            kullanici_adi: kullanici_adi
        )
    }
}
