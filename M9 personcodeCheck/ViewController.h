//
//  ViewController.h
//  personcodeCheck
//
//  Created by 윤민규 on 13. 9. 29..
//  Copyright (c) 2013년 m9. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSString *msgString, *inputString;
    IBOutlet UITextField *txtfdFirstNumber, *txtfdSecondNumber;
}
@property (nonatomic, retain) IBOutlet UITextField *txtfdFirstNumber, *txtfdSecondNumber;
-(IBAction)onBtnCheck:(id)sender;
+(NSInteger)getDaysOfYearMonth:(NSInteger)month;
@end