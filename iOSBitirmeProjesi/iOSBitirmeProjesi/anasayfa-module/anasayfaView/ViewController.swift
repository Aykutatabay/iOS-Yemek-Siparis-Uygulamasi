//
//  ViewController.swift
//  iOSBitirmeProjesi
//
//  Created by Aykut ATABAY on 9.09.2022.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController {
    @IBOutlet weak var banner: UIImageView!
    
    var yemekListesi = [yemekler]()
    var presenterNesne: viewToPresenterAnasayfaProtocol?
    
    @IBOutlet weak var YemekCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = ""
        
        YemekCollection.delegate = self
        YemekCollection.dataSource = self
        
        anasayfaRouter.createModule(ref: self)
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top:0 , left: 5, bottom:0 , right: 5)
        tasarim.minimumInteritemSpacing = 5
        tasarim.minimumLineSpacing = 5
        let genislik = YemekCollection.frame.size.width
        
        let yatay = (genislik - 20) / 3
        tasarim.itemSize = CGSize(width: yatay, height: 260.0)
        YemekCollection.collectionViewLayout = tasarim
        banner.layer.cornerRadius = 50
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        presenterNesne?.yemekleriYukle()
        //Anasayfaya dönüldüğünde veriler yüklenmiş oluacak
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            if let yemek = sender as? yemekler {
                let gidilecekVC = segue.destination as! DetayViewController
                gidilecekVC.yemek = yemek
            }
        }
    }
    
    


}

extension ViewController : PresenterToViewAnasayfaProtocol{
    func viewaVerigonder(yemekListesi: Array<yemekler>) {
        self.yemekListesi = yemekListesi
        DispatchQueue.main.async {
            self.YemekCollection.reloadData()
        }
    }
    
    
}

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return yemekListesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let yemek = yemekListesi[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "YemekCell", for: indexPath) as! YemekCell
        cell.yemekFiyat.text = "\(yemek.yemek_fiyat!) ₺"
        cell.yemekIsim.text = "\(yemek.yemek_adi!)"
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)") {
            DispatchQueue.main.async {
                cell.yemekImage.kf.setImage(with: url)
            }
        }
        cell.layer.cornerRadius = 25
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let yemek = yemekListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: yemek)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    
}

