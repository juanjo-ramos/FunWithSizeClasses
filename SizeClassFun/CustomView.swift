//
//  CustomView.swift
//  SizeClassFun
//
//  Created by Juanjo Ramos on 17/08/2016.
//

import UIKit

class CustomView: UIView {

    @IBOutlet private var hiddenConstraint: NSLayoutConstraint!
    @IBOutlet private var visibleConstraint: NSLayoutConstraint!
    private var isViewVisible: Bool!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        showDummyView(false)
    }
    
    func showDummyView(show: Bool) {
        print("\(String(CustomView)) - horizontalSizeClass: <\(self.traitCollection.horizontalSizeClass.rawValue)> - verticalSizeClass: <\(self.traitCollection.verticalSizeClass.rawValue)>")
        
//        This will prevent the app from crashing on awakeFromNib but it will crash when this is called from viewWillAppear
//        guard self.superview != nil else {return}
        
//        This will prevent the app from crashing at all
//        guard self.superview != nil && subviews.count >= 2 else {return}

        hiddenConstraint.active = !show
        visibleConstraint.active = show
        
        isViewVisible = show
    }
    
    @IBAction func buttonTapped() {
        showDummyView(!isViewVisible)
    }

}
