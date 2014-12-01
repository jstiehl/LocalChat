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
                                                 name:UIKeyboardDidChangeFrameNotification
                                               object:nil];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardWillHide:)
//                                                 name:UIKeyboardWillHideNotification
//                                               object:nil];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    
    tap.numberOfTapsRequired = 1;
    
    [self.view addGestureRecognizer:tap];
}

-(void) hideKeyboard {
    NSLog(@"hidekeyboard method fired!!!");
    [self.chatText resignFirstResponder];
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"textFieldDidEndEditing method fired!!!");
    [self hideKeyboard];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"textFieldShouldReturn method fired!!!");
    [self hideKeyboard];
    return NO;
}


-(void)keyboardWasShown: (NSNotification *)notification {
    
    CGRect keyboardStartFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    NSLog(@"%f", self.textEntryView.frame.origin.y);

    
    //For reference, log this startFrame to our console
   // NSLog(@"**keyboardStartFrame**\n x = %f\n y = %f\n width = %f\n height = %f", keyboardStartFrame.origin.x, keyboardStartFrame.origin.y, keyboardStartFrame.size.width, keyboardStartFrame.size.height);
    
    //Get keyboard frame after it is shown.
    CGRect keyboardEndFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];

    
    
    //NSNumber *keyboardTime = [[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    
    //For reference, log this startFrame to our console
    //NSLog(@"**keyboardEndFrame**\n x = %f\n y = %f\n width = %f\n Height = %f", keyboardEndFrame.origin.x, keyboardEndFrame.origin.y, keyboardEndFrame.size.width, keyboardEndFrame.size.height);
    
    //Compute the difference in the 2 keyboard y origins.
    //float origin = (keyboardStartFrame.origin.y - keyboardEndFrame.origin.y);
    
    //For reference, log this difference to our console
    //NSLog(@"**Difference**\n keyboardStartFrame - keyboardEndFrame = %f", origin);
    
    [UIView animateWithDuration:0 animations:^{
        //Create a new CGRect frame "newFrame" that can be modified since the frame property of our textEntryView cannot be modified directly.
    
        
      //  NSLog(@"**Difference**\n keyboardStartFrame - keyboardEndFrame = %f", origin);
        CGRect newFrame = self.textEntryView.frame;
        
        //Adjust our textEntryViews frame y origin by the difference
        newFrame.origin.y = keyboardEndFrame.origin.y - self.textEntryView.frame.size.height;
        
        //NSLog(@"%f",newFrame.origin.y);
        
        //Reassign our textEntryView frame to our newly adjust frame.
        self.textEntryView.frame = newFrame;
        
        NSLog(@"start frame origin is %f and end frame is %f and text frame is %f and %f", keyboardStartFrame.origin.y,keyboardEndFrame.origin.y, self.textEntryView.frame.origin.y, newFrame.origin.y);
      
    }];
    
}

-(void)keyboardWillHide: (NSNotification *)notification {

    NSLog(@"%f", self.textEntryView.frame.origin.y);
    
//    //Get the size of the keyboard so we know how far to move.
//    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
//    
//    //Move our view with a smooth animation adding the keyboard height.
//    [UIView animateWithDuration:.3 animations:^{
//        self.textEntryView.center = CGPointMake(self.textEntryView.center.x, self.textEntryView.center.y + keyboardSize.height);
//    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
