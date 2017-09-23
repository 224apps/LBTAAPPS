//
//  HomeDataSourceController.swift
//  TwitterAppDemoLBTA
//
//  Created by Abdoulaye Diallo on 1/10/17.
//  Copyright © 2017 Abdoulaye Diallo. All rights reserved.
//


import LBTAComponents
import TRON
import SwiftyJSON

class DataSourceController: DatasourceController {
    
    let errorMessageLabel : UILabel = {
        let label = UILabel()
        label.text = " Apologies. Something went wrong. Please try again later..."
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        setUpNavigationBarItems()
        view.addSubview(errorMessageLabel)
        errorMessageLabel.fillSuperview()
        Service.sharedInstance.fetchHomeFeed { (datasource, err) in
            
            if err != nil {
                self.errorMessageLabel.isHidden = true
                if let apiError = err as?  APIError<Service.JSONError> {
                    if   apiError.response?.statusCode != 200 {
                        self.errorMessageLabel.text = "Status Code was not 200"
                    }
                    self.datasource = datasource
                }
            }
        }
    }
    
    
    
    
    private func setUpNavigationBarItems(){
        setUpTitleBarItem()
        setUpLeftBarItems()
        setupRightNavItems()
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            
            guard let  user = self.datasource?.item(indexPath) as? User else { return  .zero }
            let estimatedHeight = estimatedHeightForText(user.bioText)
            return CGSize(width: view.frame.width, height: estimatedHeight + 66)
            
        } else  if indexPath.section == 1 {
            
            guard let tweet = datasource?.item(indexPath) as? Tweet else { return .zero }
            let estimatedHeight = estimatedHeightForText(tweet.message)
            return CGSize(width: view.frame.width, height: estimatedHeight + 74)
        }
        
        return CGSize(width: view.frame.width, height: 200)
    }
    
    
    func estimatedHeightForText(_ text: String) -> CGFloat {
        
        let approximateOfBioTextView =  view.frame.width - 12 - 50 - 12 - 2
        let sizeframe = CGSize(width: approximateOfBioTextView, height: 1000)
        let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16)]
        let estimatedFrame = NSString(string: text).boundingRect(with: sizeframe, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        return estimatedFrame.height
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
