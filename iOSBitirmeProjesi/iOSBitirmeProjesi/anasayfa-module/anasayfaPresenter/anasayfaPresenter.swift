//
//  anasayfaPresenter.swift
//  iOSBitirmeProjesi
//
//  Created by Aykut ATABAY on 9.09.2022.
//

import Foundation
class anasayfaPresenter: viewToPresenterAnasayfaProtocol {
    var interactorAnasayfa: PresenterToInteractorAnasayfaProtocol?
    
    var viewAnasayfa: PresenterToViewAnasayfaProtocol?
    
    func yemekleriYukle() {
        interactorAnasayfa?.yemekleriAl()
    }
    
    
}

extension anasayfaPresenter: InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yemekListesi: Array<yemekler>) {
        viewAnasayfa?.viewaVerigonder(yemekListesi: yemekListesi)
    }
    
    
}
// burada sen presenterın içinden(var ile) veri yolladıgın yollara ulasıyorsun
