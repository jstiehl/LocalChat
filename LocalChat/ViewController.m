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
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    
    tap.numberOfTapsRequired = 1;
    
    [self.view addGestureRecognizer:tap];
}

-(void) hideKeyboard {
    [self.chatText resignFirstResponder];
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    
    [self hideKeyboard];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self hideKeyboard];
    return NO;
}


-(void)keyboardWasShown: (NSNotification *)notification {
    
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    [UIView animateWithDuration:.1 animations:^{
        self.textEntryView.center = CGPointMake(self.textEntryView.center.x, self.textEntryView.center.y -keyboardSize.height);
    }];
    
}

-(void)keyboardWillHide: (NSNotification *)notification {
    //Get the size of the keyboard so we know how far to move.
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    //Move our view with a smooth animation adding the keyboard height.
    [UIView animateWithDuration:.3 animations:^{
        self.textEntryView.center = CGPointMake(self.textEntryView.center.x, self.textEntryView.center.y + keyboardSize.height);
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
