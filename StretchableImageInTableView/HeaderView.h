//
//  HeaderView.h
//  StretchableImageInTableView
//
//  Created by Moon Hayden on 2015. 5. 19..
//  Copyright (c) 2015년 Hayden. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderView : UIView
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageRatioConstraint;

@end
