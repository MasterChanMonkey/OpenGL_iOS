//
//  BCViewController.m
//  LearnOpenGLES
//
//  Created by 狮博 on 2017/8/28.
//  Copyright © 2017年 林伟池. All rights reserved.
//

#import "BCViewController.h"
#import "BCBView.h"
@interface BCViewController ()
@property(nonatomic,strong)BCBView * BCView;
    
    
@end

@implementation BCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.BCView = (BCBView *)self.view;
    // Do any additional setup after loading the view from its nib.
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
- (IBAction)bacl:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)dealloc
{

}
@end
