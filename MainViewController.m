//
//  MainViewController.m
//  KeyboardDemo
//
//  Created by Maxim Pervushin on 7/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (retain, nonatomic) IBOutlet UITextView *textView;
@property (retain, nonatomic) IBOutlet UIView *inputAccessoryView;
@property (retain, nonatomic) IBOutlet UIView *inputView;

- (IBAction)doneButtonAction:(UIButton *)sender;
- (IBAction)formattingKeyboardButtonAction:(UIButton *)sender;
- (IBAction)defaultKeyboardButtonAction:(UIButton *)sender;

- (IBAction)setBold:(UIButton *)sender;
- (IBAction)setItalic:(UIButton *)sender;
- (IBAction)setUnderline:(UIButton *)sender;

@end

@implementation MainViewController
@synthesize textView;
@synthesize inputAccessoryView;
@synthesize inputView;

- (id)init
{
    self = [super initWithNibName:@"MainView-Phone" bundle:nil];
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setTextView:nil];
    [self setInputAccessoryView:nil];
    [self setInputView:nil];
    [super viewDidUnload];
}

- (void)dealloc 
{
    [super dealloc];
}

# pragma mark - Input Accessory Actions

- (IBAction)doneButtonAction:(UIButton *)sender
{
    [self.textView resignFirstResponder];
}

- (IBAction)formattingKeyboardButtonAction:(UIButton *)sender
{
    [self.textView resignFirstResponder];
    self.textView.inputView = self.inputView;
    [self.textView becomeFirstResponder];
}

- (IBAction)defaultKeyboardButtonAction:(UIButton *)sender
{
    [self.textView resignFirstResponder];
    self.textView.inputView = nil;
    [self.textView becomeFirstResponder];
}

# pragma mark - Custom Keyboard Actions

- (IBAction)setBold:(UIButton *)sender 
{
    NSRange selectedRange = self.textView.selectedRange;
    
    if (selectedRange.location == NSNotFound) {
        self.textView.text = [self.textView.text stringByAppendingString:@"<bold></bold>"];
    } else {
        NSString *selectedText = [self.textView.text substringWithRange:selectedRange];
        NSString *textWithTags = [NSString stringWithFormat:@"%@%@%@", @"<bold>", selectedText, @"</bold>"];
        self.textView.text = [self.textView.text stringByReplacingCharactersInRange:selectedRange withString:textWithTags];
    }
}

- (IBAction)setItalic:(UIButton *)sender
{
    NSRange selectedRange = self.textView.selectedRange;
    
    if (selectedRange.location == NSNotFound) {
        self.textView.text = [self.textView.text stringByAppendingString:@"<italic></italic>"];
    } else {
        NSString *selectedText = [self.textView.text substringWithRange:selectedRange];
        NSString *textWithTags = [NSString stringWithFormat:@"%@%@%@", @"<italic>", selectedText, @"</italic>"];
        self.textView.text = [self.textView.text stringByReplacingCharactersInRange:selectedRange withString:textWithTags];
    }
}

- (IBAction)setUnderline:(UIButton *)sender 
{
    NSRange selectedRange = self.textView.selectedRange;
    
    if (selectedRange.location == NSNotFound) {
        self.textView.text = [self.textView.text stringByAppendingString:@"<underline></underline>"];
    } else {
        NSString *selectedText = [self.textView.text substringWithRange:selectedRange];
        NSString *textWithTags = [NSString stringWithFormat:@"%@%@%@", @"<underline>", selectedText, @"</underline>"];
        self.textView.text = [self.textView.text stringByReplacingCharactersInRange:selectedRange withString:textWithTags];
    }
}

@end
