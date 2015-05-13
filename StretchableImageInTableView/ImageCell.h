//
//  ImageCell.h
//  StretchableImageInTableView
//
//  Created by Hayden on 2015. 5. 13..
//  Copyright (c) 2015년 Hayden. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCell : UITableViewCell
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageRatioConstraint;
@end
