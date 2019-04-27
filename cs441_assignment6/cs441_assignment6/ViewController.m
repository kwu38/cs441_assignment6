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
@synthesize fn, ln, passcode, email;
@synthesize user_info, user_food;
NSMutableString *food_list;
- (void)viewDidLoad {
    // Do any additional setup after loading the view.
    [user_info setHidden:TRUE];
    [user_food setHidden:TRUE];
    [button2 setHidden:TRUE];
    user_info.numberOfLines = 0;
    user_food.numberOfLines = 0;
}
-(IBAction)createAccount:(id)sender{
    [button setHidden:TRUE];
    [fn setHidden:TRUE];
    [ln setHidden:TRUE];
    [passcode setHidden:TRUE];
    [email setHidden:TRUE];
    [user_info setHidden:FALSE];
    [user_food setHidden:FALSE];
    [button2 setHidden:FALSE];
    [user_info setText:[NSString stringWithFormat:@"%@ %@", fn.text, ln.text]];
    NSURL *url = [NSURL URLWithString:@"https://cs.binghamton.edu/~kwu38/php/create_account.php"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5.0];
    request.HTTPMethod = @"POST";
    [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    NSMutableDictionary *postDict = [[NSMutableDictionary alloc] init];
    [postDict setValue:@"fn" forKey:fn.text];
    [postDict setValue:@"ln" forKey:ln.text];
    [postDict setValue:@"email" forKey:email.text];
    [postDict setValue:@"passcode" forKey:passcode.text];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:postDict options:0 error:nil];
    NSString *urlString =  [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSString *stringData = [[NSString alloc] initWithFormat:@"jsonRequest=%@", urlString];
    NSData *requestBodyData = [stringData dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody = requestBodyData;
    
}

-(IBAction)addItem:(id)sender{
    __block NSString *temp_string = nil;
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Add Item"
                                                                   message:@""
                                                            preferredStyle:UIAlertControllerStyleAlert];

    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Item";
        temp_string = textField.text;
       [food_list appendString: temp_string];
       [food_list appendString: @"\n"];
       [user_food setText:food_list];
    }];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"ADD" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    [user_food setText: [NSString stringWithFormat:@"%s \n %s \n %s \n %s \n %s \n %s \n %s \n %s",
                         "3 Eggs", "Milk (1 CUP)", "Turkey Sandwich", "Coffee (1 CUP)",
                         "Chicken Breast (3OZ)", "Broccoli (1.5OZ)", "Brown Rice (4 OZ)", "Orange Juice (1 CUP)"]];
    
   [food_list appendString:@"Broccoli (1.5OZ)"];
    [food_list appendString: @"\n"];
    [food_list appendString:@"Pasta (4OZ)"];
    [food_list appendString: @"\n"];
    [food_list appendString:@"Orange Juice (1 CUP)"];
    [food_list appendString: @"\n"];
    [user_food setText:food_list];
    
}

@end
