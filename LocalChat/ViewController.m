//
//  ViewController.m
//  LocalChat
//
//  Created by James Stiehl on 11/20/14.
//  Copyright (c) 2014 James Stiehl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

-(void) hideKeyboard {
    [self.chatText resignFirstResponder];
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    

    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self hideKeyboard];
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
