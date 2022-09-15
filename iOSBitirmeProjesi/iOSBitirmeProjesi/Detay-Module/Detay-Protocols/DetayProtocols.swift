//
//  DetayProtocols.swift
//  iOSBitirmeProjesi
//
//  Created by Aykut ATABAY on 11.09.2022.
//

import Foundation
protocol ViewToPresenterDetayProtocol {
    var detayInteractor: PresenterToInteractorDetayProtocol? { get set }
    
    func sepeteEkle( yemek_adi: String ,yemek_resim_adi: String, yemek_fiyat: Int, yemek_siparis_adet: Int, kullanici_adi: String)
}

protocol PresenterToInteractorDetayProtocol {
    func sepeteYemekEkle( yemek_adi: String ,yemek_resim_adi: String, yemek_fiyat: Int, yemek_siparis_adet: Int, kullanici_adi: String)
    
}

protocol PresenterToRouterDetayProtocol {
    static func createModule( ref: DetayViewController)
}
