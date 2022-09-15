//
//  anasayfaInteractor.swift
//  iOSBitirmeProjesi
//
//  Created by Aykut ATABAY on 9.09.2022.
//

import Foundation
import Alamofire
class anasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
    var presenterAnasayfa : InteractorToPresenterAnasayfaProtocol?
    
    func yemekleriAl() {
        print("hellooo")
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .get).response { response in
            if let data = response.data{
                do {
                    
                    let cevap = try JSONDecoder().decode(yemeklerCevap.self, from: data)
                    print(cevap)
                    if let liste = cevap.yemekler{
                        
                        self.presenterAnasayfa?.presenteraVeriGonder(yemekListesi: liste)
                    }
                }catch{
                    print(error.localizedDescription)
                }

            }
            
        }
    }
    
    
}

