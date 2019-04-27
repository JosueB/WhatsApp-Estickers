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
    
    
    let estickers: [EstickerItem] = [EstickerItem(imageUrl: "Barcelona"),
                                     EstickerItem(imageUrl: "Barcelona"),
                                     EstickerItem(imageUrl: "Barcelona"),
                                     EstickerItem(imageUrl: "Barcelona"),
                                     EstickerItem(imageUrl: "Barcelona"),
                                     EstickerItem(imageUrl: "Barcelona"),
                                     EstickerItem(imageUrl: "Barcelona")
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return estickers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailCell", for: indexPath) as! DetailViewCell
        cell.mImage.image = UIImage(named: estickers[indexPath.row].imageUrl)
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


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
