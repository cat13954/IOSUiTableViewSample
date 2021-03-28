//
//  MeViewController.swift
//  uitable
//
//  Created by Alice on 2021/3/8.
//

import UIKit
import SnapKit
import JXSegmentedView
class MeViewController: BaseViewController {

    private lazy var lab: UILabel = {
        let label = UILabel()
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(lab)
        lab.text = "测试me"
        lab.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
}
