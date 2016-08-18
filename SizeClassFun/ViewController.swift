//
//  ViewController.swift
//  SizeClassFun
//
//  Created by Juanjo Ramos on 16/08/2016.
//

import UIKit

class ViewController: UIViewController {

    private var customView: CustomView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\(String(ViewController)) viewDidLoad - horizontalSizeClass: <\(self.traitCollection.horizontalSizeClass.rawValue)> - verticalSizeClass: <\(self.traitCollection.verticalSizeClass.rawValue)>")
        
        guard let customView = NSBundle.mainBundle().loadNibNamed(String(CustomView), owner: self, options: nil).first as? CustomView else {
            assertionFailure()
            return
        }
        
        customView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(customView)
        let views = ["customView": customView]
        let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("|[customView]|", options: [], metrics: nil, views: views)
        let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|[customView]|", options: [], metrics: nil, views: views)
        view.addConstraints(horizontalConstraints)
        view.addConstraints(verticalConstraints)
        
        self.customView = customView
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("\(String(ViewController)) viewWillAppear - horizontalSizeClass: <\(self.traitCollection.horizontalSizeClass.rawValue)> - verticalSizeClass: <\(self.traitCollection.verticalSizeClass.rawValue)>")
        
        customView.showDummyView(false)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("\(String(ViewController)) viewDidAppear - horizontalSizeClass: <\(self.traitCollection.horizontalSizeClass.rawValue)> - verticalSizeClass: <\(self.traitCollection.verticalSizeClass.rawValue)>")
        
        customView.showDummyView(false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

