//
//  ViewController.swift
//  iOSBitirmeProjesi
//
//  Created by Aykut ATABAY on 11.09.2022.
//

import UIKit

class DetayViewController: UIViewController {

    @IBOutlet weak var DetayImage: UIImageView!
    
    @IBOutlet weak var yumurtaImage: UIImageView!
    
    @IBOutlet weak var yemekIsimLabel: UILabel!
    
    @IBOutlet weak var yemekFiyatLabel: UILabel!
    
    
    @IBOutlet weak var AdetTF: UITextField!
    
    @IBOutlet weak var AdetStepper: UIStepper!
    
    var yemek:yemekler?
    var DetayViewPresenterNesne: ViewToPresenterDetayProtocol?
    
    var sepetid: sepet_yemekler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yumurtaImage.layer.cornerRadius = 30
        AdetTF.text = "0"
        DetayRouter.createModule(ref: self)

        if let y = yemek{
            yemekIsimLabel.text = "\(y.yemek_adi!)"
            yemekFiyatLabel.text = "\(y.yemek_fiyat!) ₺"
            if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(y.yemek_resim_adi!)") {
                DispatchQueue.main.async {
                    self.DetayImage.kf.setImage(with: url)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSepet" {
            
            if let food = sender as? yemekler {
                let gidilecekVC = segue.destination as! SepetViewController
                gidilecekVC.food = food
                
                
            }
            
        }
        if segue.identifier == "toSepet" {
            let adet = AdetTF.text
            let nextVC = segue.destination as! SepetViewController
            nextVC.sepet_yemek_adet = adet

        }
    }
    @IBAction func ButtonSepeteEkle(_ sender: Any) {
        print("---xxxxxx----")
        if let food = yemek, let adet = AdetTF.text{
            print(food.yemek_adi!)
            print(adet)
            DetayViewPresenterNesne?.sepeteEkle(yemek_adi: food.yemek_adi!, yemek_resim_adi: food.yemek_resim_adi!, yemek_fiyat: Int(food.yemek_fiyat!)!, yemek_siparis_adet: Int(adet)! , kullanici_adi: "aykut_atabay")
            print(adet)
            
            
            performSegue(withIdentifier: "toSepet", sender: food)
        }
        
    }

    @IBAction func stepperControl(_ sender: UIStepper) {
        AdetTF.text = String(Int(sender.value))
  
    }

}
