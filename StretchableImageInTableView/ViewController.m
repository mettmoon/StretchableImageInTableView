//
//  ViewController.m
//  StretchableImageInTableView
//
//  Created by Hayden on 2015. 5. 13..
//  Copyright (c) 2015년 Hayden. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageRatioConstraint;

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
    return 20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"section:%i, row:%i",(int)indexPath.section, (int)indexPath.row];
    return cell;
}
#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat zeroPointY = scrollView.contentOffset.y + scrollView.contentInset.top;
    if(self.imageRatioConstraint && zeroPointY <= 0){
        self.imageHeightConstraint.constant = self.tableView.tableHeaderView.frame.size.width / self.imageRatioConstraint.multiplier - zeroPointY;
        NSLog(@"zeroPoint:%f, height:%f",zeroPointY, self.imageHeightConstraint.constant);
        [self.tableView.tableHeaderView layoutIfNeeded];
    }
}

@end
