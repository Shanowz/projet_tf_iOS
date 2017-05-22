//
//  HomeViewController.swift
//  projet
//
//  Created by student5302 on 28/02/17.
//  Copyright © 2017 student5302. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var HomeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    /**
     * Defining the cells
     */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 4
        
        if(indexPath.row > 0){
          //  cell.carStack.isHidden = true
        }
        
        return cell
    }
    
    
    /**
     * Initial size
     */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // The first cell always start expanded with an height of 300
        if(indexPath.row == 0){
            return CGSize(width: collectionView.bounds.size.width, height: 300)
        }else{
            // The others start with an height of 80
            return CGSize(width: collectionView.bounds.size.width, height: 80)
        }
    }
    
    /**
     * This functio shoud be handling everything like an accordeon system.
     * When I touch one cell, the others should collapse.
     */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Animate resize of cell after tapping
        UIView.animate(withDuration: 0.2, animations: {
            // For now I have 3 cells, which I will loop
            for i in 0...2{
                // If this is the active cell (I just tapped on) ...
                if(indexPath.row == i){
                    let cell = collectionView.cellForItem(at: indexPath) as! HomeCollectionViewCell
                    // This cell is expanded already, collapse it
                    if(cell.frame.size.height > 200){
            //            cell.carStack.isHidden = true
                        cell.frame.size = CGSize(width: collectionView.bounds.size.width, height: 80)
                    }else{
                        // Open up this cell
              //          cell.carStack.isHidden = false
                        cell.frame.size = CGSize(width: collectionView.bounds.size.width, height: 300)
                    }
                }else{
                    // Other cells besides the one I just tapped, will be collapsed
                    print(indexPath.row, indexPath.section)
                    let customPath = IndexPath(row: i, section: 0)
                    print(customPath.row, customPath.section)
                    let cell = collectionView.cellForItem(at: customPath) as! HomeCollectionViewCell
                //    cell.carStack.isHidden = true
                    cell.frame.size = CGSize(width: collectionView.bounds.size.width, height: 80)
                }
            }
        })
        
    }
    
}
