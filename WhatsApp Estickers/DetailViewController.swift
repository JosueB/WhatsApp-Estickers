//
//  DetailViewController.swift
//  WhatsApp Estickers
//
//  Created by Josue on 1/10/19.
//  Copyright © 2019 Riley Norris. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    @IBOutlet weak var mCollectionView: UICollectionView!
    
    var stickerPacks: [StickerPack]!
    
    
    var stickers: [Sticker] = []

    
    override func viewDidAppear(_ animated: Bool) {
        fetchStickerPacks()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if stickerPacks?.isEmpty == false {
            return stickerPacks[0].stickers.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailCell", for: indexPath) as! DetailViewCell
        if stickerPacks?.isEmpty == false {
            cell.mImage.image = stickerPacks[0].stickers[indexPath.row].imageData.image
        }
        return cell
    }
    
    
    // MARK Methods that need to be over-written to display 3 rows in the collection view cell.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.bounds.width/3.0
        let yourHeight = yourWidth
        
        return CGSize(width: yourWidth, height: yourHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    @IBAction func addToWhatsApp(_ sender: Any) {
        stickerPacks[0].sendToWhatsApp { result in
            let yes: UIAlertController = UIAlertController(title: "Success", message: "\n\n", preferredStyle: .alert)
            if result {
                self.present(yes, animated: true, completion: nil)

            }


            
            
        }
        
        
    }
    
    private func fetchStickerPacks() {
        let loadingAlert: UIAlertController = UIAlertController(title: "Loading sticker packs", message: "\n\n", preferredStyle: .alert)
        loadingAlert.addSpinner()
        present(loadingAlert, animated: true, completion: nil)
        
        do {
            try StickerPackManager.fetchStickerPacks(fromJSON: StickerPackManager.stickersJSON(contentsOfFile: "sticker_packs")) { stickerPacks in
                print("josue1")
                
                loadingAlert.dismiss(animated: false, completion: {
                    print("josue")
                    self.navigationController?.navigationBar.alpha = 1.0;
                    self.stickerPacks = stickerPacks
                    self.mCollectionView.reloadData()
                })
            }
        } catch StickerPackError.fileNotFound {
            fatalError("sticker_packs.wasticker not found.")
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
