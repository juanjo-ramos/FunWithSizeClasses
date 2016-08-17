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
        
        changeDummyViewVisibility(false)
    }
    
    func changeDummyViewVisibility(show: Bool) {        
        hiddenConstraint.active = !show
        visibleConstraint.active = show
        
        isViewVisible = show
    }
    
    @IBAction func buttonTapped() {
        changeDummyViewVisibility(!isViewVisible)
    }

}
