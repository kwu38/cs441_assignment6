//
//  ViewController.m
//  cs441_assignment6
//
//  Created by Kevin Wu on 4/20/19.
//  Copyright © 2019 Kevin Wu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize button, button2;
@synthesize label;
@synthesize image;
- (void)viewDidLoad {
    [super viewDidLoad];
    if(toggle == 0){
        [label setText:@"I love Java and Android!"];
        image.image = [UIImage imageNamed : @"madden.png"];
        toggle = 1;
    }
    else
    {
        [label setText:@ "Hello World"];
        image.image = [UIImage imageNamed : @"iOS_11_GM_Wallpaper_Earth.jpg"];
        toggle = 0;
    }
    // Do any additional setup after loading the view.
}
for (int i = 0; i < 100; i ++){
    
}
while();
@end
