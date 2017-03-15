//
//  HomeDataSourceController.swift
//  TwitterAppDemoLBTA
//
//  Created by Abdoulaye Diallo on 1/10/17.
//  Copyright © 2017 Abdoulaye Diallo. All rights reserved.
//


import LBTAComponents

class DataSourceController: DatasourceController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let datasource = DataSource()
        self.datasource = datasource
        
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        setUpNavigationBarItems()
        
        
    }
    
    
    private func setUpNavigationBarItems(){
        setUpTitleBarItem()
        setUpLeftBarItems()
        setupRightNavItems()
    }
    
  
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        if   let  user = self.datasource?.item(indexPath) as? User{
            let width =  view.frame.width - 12 - 50 - 12 - 2
            let sizeframe = CGSize(width: width, height: 1000)
            let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 16)]
            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: sizeframe, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
        }
        
        return CGSize(width: view.frame.width, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        if section == 1 {
             return .zero
        }
        return CGSize(width: view.frame.width, height: 100)
    }
}
