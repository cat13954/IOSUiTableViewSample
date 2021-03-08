//
//  CeViewController.swift
//  uitable
//
//  Created by Alice on 2021/3/8.
//

import UIKit
import SnapKit
class CeViewController: UIViewController {

    private lazy var lab: UILabel = {
        let label = UILabel()
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(lab)
        lab.text = "xiao ce"
        lab.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }

}
