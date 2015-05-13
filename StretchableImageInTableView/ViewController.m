//
//  ViewController.m
//  StretchableImageInTableView
//
//  Created by Hayden on 2015. 5. 13..
//  Copyright (c) 2015년 Hayden. All rights reserved.
//

#import "ViewController.h"
#import "ImageCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
        default:
            return 20;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0){
        return 200;
    }else{
        return 40;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0){
        ImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell" forIndexPath:indexPath];
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
        cell.textLabel.text = [NSString stringWithFormat:@"section:%i, row:%i",(int)indexPath.section, (int)indexPath.row];
        return cell;
    }
}
#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    ImageCell *cell = (ImageCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    CGFloat zeroPointY = scrollView.contentOffset.y + scrollView.contentInset.top;
    if(cell.imageRatioConstraint && zeroPointY <= 0){
        cell.imageHeightConstraint.constant = cell.frame.size.width / cell.imageRatioConstraint.multiplier - zeroPointY + 22;
        [cell layoutIfNeeded];
    }
}

@end
