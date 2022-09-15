//
//  SepetInteractor.swift
//  iOSBitirmeProjesi
//
//  Created by Aykut ATABAY on 13.09.2022.
//

import Foundation
import Alamofire
class SepetInteractor: PresenterToInteractorSepetProtocol {
    var presenterSepet: InteractortoPresenterSepetProtocol?
    
    func sepetYemekSil(sepet_yemek_id: Int, kullanici_adi: String) {
        let params: Parameters = ["sepet_yemek_id": sepet_yemek_id, "kullanici_adi": kullanici_adi]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php", method: .post, parameters: params).response {response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(SepetYemeklerCevap.self, from: data)
                    print(cevap)
                
                    self.sepetYemekAl(kullanici_adi: kullanici_adi)
                } catch {
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    
    func sepetYemekAl(kullanici_adi: String) {
        let parameter: Parameters = ["kullanici_adi": kullanici_adi]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: parameter).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(SepetYemeklerCevap.self, from: data)
                    
                    print(cevap)
                    
                    if let list = cevap.sepet_yemekler {
                        self.presenterSepet?.SepetPresenteraVeriGonder(sepettekiYemekListe: list)
                    }
                } catch {
                    self.presenterSepet?.SepetPresenteraVeriGonder(sepettekiYemekListe: [])
                    print(error.localizedDescription)
                    
                }
            }
        }
    }
}
