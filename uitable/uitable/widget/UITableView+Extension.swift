//
//  UITableView+Extension.swift
//  HttpDemo
//
//  Created by Alice on 2021/3/14.
//  Copyright © 2021 Alice. All rights reserved.
//

//
//  UITableView+Extension.swift
//  Created by Anup Deshpande on 3/8/21.
//
import UIKit

public extension UITableView{
    
    /// Displays no data available in user friendly way
    /// - Parameters:
    ///   - image: Image related to the data in the table
    ///   - title: String title that will be shown below image
    func setEmptyDataView(image: UIImage, title: String){
        
        // Create uiview to fill entire table view
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        
        let picture = UIImageView()
        let titleLabel = UILabel()
        
        picture.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        picture.image = image
        picture.contentMode = .scaleAspectFit
        
        titleLabel.text = title
        
        if #available(iOS 13.0, *) {
            titleLabel.textColor = UIColor.secondaryLabel
        } else {
            titleLabel.textColor = UIColor.black
        }
        
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        titleLabel.textAlignment = .center
        
        emptyView.addSubview(picture)
        emptyView.addSubview(titleLabel)
        
        let constraints = [
            picture.widthAnchor.constraint(equalToConstant: 80),
            picture.heightAnchor.constraint(equalToConstant: 80),
            picture.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor),
            picture.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: picture.bottomAnchor, constant: 10)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        self.backgroundView = emptyView
        
    }
    
    /// Removes empty data view from tableView
    func removeEmptyDataView(){
        self.backgroundView = nil
    }
}
