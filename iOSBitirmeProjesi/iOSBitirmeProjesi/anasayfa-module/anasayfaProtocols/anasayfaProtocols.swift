//
//  anasayfaProtocols.swift
//  iOSBitirmeProjesi
//
//  Created by Aykut ATABAY on 9.09.2022.
//

import Foundation
protocol viewToPresenterAnasayfaProtocol {
    //burada presenter içindeyim ve veri yolladıgım protokollere erismem lazım
    var interactorAnasayfa:PresenterToInteractorAnasayfaProtocol? { get set } //interactorAnasayfa degiskeni ile yemekleriAl() fonksiyonuna ulastım
    var viewAnasayfa:PresenterToViewAnasayfaProtocol? { get set } //viewanasayfa degiskei ile de vieweverigonder fonskiyonuna eristim
    func yemekleriYukle()
    
    
}
protocol PresenterToInteractorAnasayfaProtocol {
    //burada interctor içindeyim
    var presenterAnasayfa: InteractorToPresenterAnasayfaProtocol? { get set }//buradan da presenteravERİGONDER FONSKİYONUNA ULASIYORUM
    func yemekleriAl()
}

//TASIYICI
protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yemekListesi: Array<yemekler>)
    //burada interactor içinde webden aldıgımız verileri yemekListesi(degisken türü array) niniçine ekleyen fonksiyon yazdık
}

protocol PresenterToViewAnasayfaProtocol {
    func viewaVerigonder(yemekListesi: Array<yemekler>)
}

//ROUTER
protocol PresenterToRouterAnasayfaProtocol {
    static func createModule(ref: ViewController)
}
