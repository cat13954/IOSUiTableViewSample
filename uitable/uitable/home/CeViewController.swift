//
//  CeViewController.swift
//  uitable
//
//  Created by Alice on 2021/3/8.
//

import UIKit
import SnapKit
class CeViewController: BaseViewController {

    private lazy var lab: UIButton = {
        let label = UIButton()
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(lab)
        lab.setTitle("test", for: .normal)
        lab.setTitleColor(UIColor.red, for: .normal)
        lab.setTitleColor(UIColor.black, for: .selected)
        lab.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            lab.width = 100
            lab.height = 100
        }
        lab.addTarget(self, action: #selector(testClick), for: .touchUpInside)
    }
        
    @objc func testClick() {
        navigationController?.pushViewController(TestViewController(), animated: true)
    }
}
