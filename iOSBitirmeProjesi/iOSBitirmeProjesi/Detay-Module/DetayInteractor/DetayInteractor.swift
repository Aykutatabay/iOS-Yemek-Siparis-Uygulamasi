//
//  DetayInteractor.swift
//  iOSBitirmeProjesi
//
//  Created by Aykut ATABAY on 11.09.2022.
//

import Foundation
import Alamofire

class DetayInteractor: PresenterToInteractorDetayProtocol {
    func sepeteYemekEkle(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_siparis_adet: Int, kullanici_adi: String) {
        print("_________")
        print("\(yemek_adi)")
        let params: Parameters = ["yemek_adi": yemek_adi, "yemek_resim_adi": yemek_resim_adi, "yemek_fiyat": yemek_fiyat, "yemek_siparis_adet": yemek_siparis_adet, "kullanici_adi": kullanici_adi]
        print("\(yemek_adi)")
        print(params)
            AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php", method: .post, parameters: params).response { response in
                print(response)
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(SepetYemeklerCevap.self, from:data)
                    
                    print(cevap)
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
