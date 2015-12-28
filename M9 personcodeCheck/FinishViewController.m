//
//  FinishViewController.m
//  personcodeCheck
//
//  Created by 윤민규 on 13. 10. 3..
//  Copyright (c) 2013년 m9. All rights reserved.
//

#import "FinishViewController.h"

@interface FinishViewController ()
@end

@implementation FinishViewController

@synthesize lblMsg = _lblMsg;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _lblMsg.text = @"테스트";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
