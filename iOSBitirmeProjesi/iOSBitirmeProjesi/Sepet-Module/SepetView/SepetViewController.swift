//
//  SepetViewController.swift
//  iOSBitirmeProjesi
//
//  Created by Aykut ATABAY on 13.09.2022.
//

import UIKit
import Alamofire
import Kingfisher
class SepetViewController: UIViewController {
    @IBOutlet weak var sepetTableView: UITableView!
    
    @IBOutlet weak var ToplamTF: UITextField!
    
    
    var food: yemekler?
    var sepet_yemek_adet: String?
    var sepettekiYemekListe: [sepet_yemekler] = []
    var SepetPresenterNesne: ViewToPresenterSepetProtocol?
    var sum: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SepetRouter.createModule(ref: self)
        sepetTableView.delegate = self
        sepetTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        SepetPresenterNesne?.yemekAl(kullanici_adi: "aykut_atabay")
    }
}
extension SepetViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sepettekiYemekListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sepetteki_yemek = sepettekiYemekListe[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SepetCell", for: indexPath) as! SepetCell
        cell.labelYemekAd.text = "\(sepetteki_yemek.yemek_adi!)"
        cell.labelYemekAdet.text = "\(sepetteki_yemek.yemek_siparis_adet!) Adet"

        if let x = Int(sepetteki_yemek.yemek_siparis_adet!), let y = Int(sepetteki_yemek.yemek_fiyat!) {
            let z = x * y
            cell.labelYemekFiyat.text = "\(z) ₺"
        }
        
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(sepetteki_yemek.yemek_resim_adi!)") {
            DispatchQueue.main.async {
                cell.sepetImage.kf.setImage(with: url)
            }
        }
        cell.layer.cornerRadius = 15
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { (ContextualAction, view, bool) in
            let yemek = self.sepettekiYemekListe[indexPath.row]
            var yemekId: Int = 0
            if let id = yemek.sepet_yemek_id {
                yemekId = Int(id) ?? 0
            }
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(yemek.yemek_adi!) Silinsin mi?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive) { action in
                self.SepetPresenterNesne?.sepetInteractor?.sepetYemekSil(sepet_yemek_id: yemekId, kullanici_adi: "aykut_atabay")
                tableView.reloadData()
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
extension SepetViewController: PresenterToViewSepetProtocol {
    func SepetViewaVeriGonder(sepettekiYemekListe: [sepet_yemekler]) {
        self.sepettekiYemekListe = sepettekiYemekListe
        sum = 0
        if !sepettekiYemekListe.isEmpty {
            for yemek in sepettekiYemekListe {
                if let stringPrice = yemek.yemek_fiyat,
                   let stringCount = yemek.yemek_siparis_adet,
                   let price = Int(stringPrice),
                   let count = Int(stringCount) {
                    sum += price * count
                    
                    ToplamTF.text = "\(sum) ₺"
                }
            }
        }else{
            let sum:Int = 0
            
            ToplamTF.text = "\(sum) ₺"
        }
        
        DispatchQueue.main.async {
            self.sepetTableView.reloadData()
            print(self.sum)
        }
    }
}
