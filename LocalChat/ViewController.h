//
//  ViewController.h
//  LocalChat
//
//  Created by James Stiehl on 11/20/14.
//  Copyright (c) 2014 James Stiehl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView *textEntryView;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@property (weak, nonatomic) IBOutlet UITextField *chatText;
@property (weak, nonatomic) IBOutlet UITextView *chatTextView;

@end

