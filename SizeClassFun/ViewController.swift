//
//  ViewController.swift
//  SizeClassFun
//
//  Created by Juanjo Ramos on 16/08/2016.
//

import UIKit

class ViewController: UIViewController {

    fileprivate var customView: CustomView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\(String(describing: ViewController.self)) viewDidLoad - horizontalSizeClass: <\(self.traitCollection.horizontalSizeClass.rawValue)> - verticalSizeClass: <\(self.traitCollection.verticalSizeClass.rawValue)>")
        
        guard let customView = Bundle.main.loadNibNamed(String(describing: CustomView.self), owner: self, options: nil)?.first as? CustomView else {
            assertionFailure()
            return
        }
        
        customView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(customView)
        let views = ["customView": customView]
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "|[customView]|", options: [], metrics: nil, views: views)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[customView]|", options: [], metrics: nil, views: views)
        view.addConstraints(horizontalConstraints)
        view.addConstraints(verticalConstraints)
        
        self.customView = customView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\(String(describing: ViewController.self)) viewWillAppear - horizontalSizeClass: <\(self.traitCollection.horizontalSizeClass.rawValue)> - verticalSizeClass: <\(self.traitCollection.verticalSizeClass.rawValue)>")
        
//        customView.showDummyView(false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("\(String(describing: ViewController.self)) viewDidAppear - horizontalSizeClass: <\(self.traitCollection.horizontalSizeClass.rawValue)> - verticalSizeClass: <\(self.traitCollection.verticalSizeClass.rawValue)>")
        
//        customView.showDummyView(false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

