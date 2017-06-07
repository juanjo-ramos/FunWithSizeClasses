# FunWithSizeClasses
This small project to reproduce a problem I encounterd while working with Size Classes.

## Context
There is a single view controller - (ViewController.swift)[https://github.com/juanjo-ramos/FunWithSizeClasses/blob/master/SizeClassFun/ViewController.swift]. A custom view is designed on a separate file [CustomView.xib] (https://github.com/juanjo-ramos/FunWithSizeClasses/blob/master/SizeClassFun/CustomView.xib) which gets added the view controller's view on `viewDidLoad()`

That view has:
* One `UIButton` added for Any-Any size class.
* One `UIView` added for Regular-Regular size class only.

To hide and show the `UIView` 2 constraints with their corresponding `IBOutlet` are added:
1. One to align the `Top` of the button and the view - Identifier: `HiddenConstraint`
2. One to align the `Bottom` of the view to the `Top` of the button - Identifier: `VisibleConstraint`

[CustomView.swift] (https://github.com/juanjo-ramos/FunWithSizeClasses/blob/master/SizeClassFun/CustomView.swift) contains a [method - showDummyView(_:)] (https://github.com/juanjo-ramos/FunWithSizeClasses/blob/master/SizeClassFun/CustomView.swift#L22) to show and hide the view by activating and deactivating the above constraints.

## Problem
Trying to activate or deactivate any of the above constraints on `awakeFromNib()` would produce the following crash:
```
*** Terminating app due to uncaught exception 'NSGenericException', reason: 'Unable to activate constraint with items <UIView: 0x7fa850d977c0; frame = (0 0; 600 600); autoresize = RM+BM; layer = <CALayer: 0x7fa850d94790>> and <UIButton: 0x7fa850d95240; frame = (0 549; 600 51); opaque = NO; autoresize = RM+BM; layer = <CALayer: 0x7fa850d957b0>> because they have no common ancestor.  Does the constraint reference items in different view hierarchies?  That's illegal.'
```
Just run the project as is to see this. That could be kind of expected since the main view has not being added to the view hierarchy yet

Remove the comment on `showDummyView(_:)` and the same crash will be seeing this time when the call comes from `viewWillAppear` on the view controller.

## What's going on?
The `UIView` is `CustomView`, the one added for `Regular - Regular` only, is not in the view hierarchy neither on `awakeFromNib` nor on `viewWillAppear`.

It seems that the `traitCollection` property of `CustomView` gets set to `Regular - Regular` a bit later than what I would expect. In particular:
* In `awakeFromNib()` it is `Unspecified - Unspecified` which is kind of expected.
* On `viewWillAppear()` and it is **still** `Unspecified - Unspecified`.
* On `viewDidAppear()` it is `Regular - Regular`.

On the contrary, the view controller has the `Regular - Regular` traitCollection since `viewDidLoad()`
