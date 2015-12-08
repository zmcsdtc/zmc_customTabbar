//
//  TempViewController.m
//  tarbar-选中状态-背景色
//
//  Created by ZMC on 15/12/6.
//  Copyright © 2015年 Zmc. All rights reserved.
//

#import "TempViewController.h"
#import "AppDelegate.h"
#import "CustomTabbarController.h"
@interface TempViewController ()

@end

@implementation TempViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    AppDelegate *appDele = [UIApplication sharedApplication].delegate;
    //显示tabBar
     CustomTabbarController* tabBarCtrl= (CustomTabbarController *)appDele.window.rootViewController;
    [tabBarCtrl hiddenTabbar];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [super viewWillAppear:animated];
    
    AppDelegate *appDele = [UIApplication sharedApplication].delegate;
    //显示tabBar
    CustomTabbarController* tabBarCtrl= (CustomTabbarController *)appDele.window.rootViewController;
    [tabBarCtrl hiddenTabbar];

}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [super viewWillAppear:animated];
    
    AppDelegate *appDele = [UIApplication sharedApplication].delegate;
    //显示tabBar
    CustomTabbarController* tabBarCtrl= (CustomTabbarController *)appDele.window.rootViewController;
    [tabBarCtrl showTabbar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
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
