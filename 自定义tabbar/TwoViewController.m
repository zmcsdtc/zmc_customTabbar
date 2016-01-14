//
//  TwoViewController.m
//  tarbar-选中状态-背景色
//
//  Created by ZMC on 15/12/6.
//  Copyright © 2015年 Zmc. All rights reserved.
//

#import "TwoViewController.h"
#import "TempViewController.h"
@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor cyanColor];
    self.navigationItem.title=@"ONE";
}
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"dianjile");
    TempViewController*temp=[[TempViewController alloc] init];
    [self.navigationController pushViewController:temp animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
