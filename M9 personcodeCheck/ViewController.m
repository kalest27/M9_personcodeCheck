//
//  ViewController.m
//  personcodeCheck
//
//  Created by 윤민규 on 13. 9. 29..
//  Copyright (c) 2013년 m9. All rights reserved.
//

/*
 프로그램명: 주민등록번호 유효성 검사 프로그램
 제출자: 윤민규
 학번: 1312140
 */

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

@synthesize txtfdFirstNumber = _txtfdFirstNumber;
@synthesize txtfdSecondNumber = _txtfdSecondNumber;

// 월의 최대일 구하는 클래스 메서드
+ (NSInteger)getDaysOfYearMonth: (NSInteger)month {
    NSInteger totalDays = 0;

    if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12)
        totalDays = 31;
    else if (month == 4 || month == 6 || month == 9 || month == 11)
        totalDays = 30;
    else
            totalDays = 29;
    return totalDays;
}

// 라운드 버튼을 터치하면 발생하는 메서드
- (IBAction)onBtnCheck:(id)sender {
    // String도 가능하지만 차후에 보수를 위한 배열 객체로 선언
    NSArray *secretCode = [NSArray arrayWithObjects: @"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"2",@"3",@"4",@"5",nil];
    NSInteger i, temp = 0;

    if ([_txtfdFirstNumber.text isEqual: @""])         // 앞자리 텍스트필드 값이 공백인지 검사
        msgString = @"주민등록번호 앞자리를 입력해주세요";      // msgString 문자열 객체에 문자열 저장
    else if([_txtfdSecondNumber.text isEqual: @""])    // 뒷자리 텍스트필드 값이 공백인지 검사
        msgString = @"주민등록번호 뒷자리를 입력해주세요";      // msgString 문자열 객체에 문자열 저장
    else if([_txtfdFirstNumber.text length] != 6)      // 앞자리 텍스트필드 값이 6자리인지 검사
        msgString = @"주민등록번호 앞자리는 6개를 입력해주세요";  // msgString 문자열 객체에 문자열 저장
    else if([_txtfdSecondNumber.text length] != 7)     // 뒷자리 텍스트필드 값이 7자리인지 검사
        msgString = @"주민등록번호 뒷자리는 7개를 입력해주세요";  // msgString 문자열 객체에 문자열 저장
    else {                                             // 위 모든 조건이 성립되지 않는다면 실행
        // '앞자리 텍스트필드 값' 뒤에 '뒷자리 텍스트필드 값'을 연결시키며 inputString 저장
        inputString = [_txtfdFirstNumber.text stringByAppendingString:_txtfdSecondNumber.text];

        // 총 12번동안 반복되는 반복문
        for (i=0; i<12; i++) {
            /* ----------------------------------------------------------------------
             1. inputString 문자열에 i번째 index부터 1byte 값을 int형 데이터로 변환
             2. secretCode 배열 객체에 저장된 i번째 index 값을 int형 데이터로 변환
             3. 위 1, 2번에 변환 된 int형 데이터끼리 곱한 값을 temp 변수와 더한 다음 temp 변수에 저장
             4. 위 1, 2, 3번 과정을 총 12번 반복하여 총합을 저장
             ---------------------------------------------------------------------- */
            temp += [[inputString substringWithRange: NSMakeRange(i, 1)] integerValue] * [[secretCode objectAtIndex:i] integerValue];
        }
        temp %= 11;                                    // temp 값을 11로 나눈 나머지 값을 temp 변수에 저장
        temp = 11 - temp;                              // 11과 temp 값의 차를 temp 변수에 저장
        if(temp >= 10)                                 // temp 변수 값이 10 이상인지 검사
            temp -= 10;                                // temp 변수 값이 10 이상이라면, temp 값과 10의 차를 temp 변수에 저장

        if([[inputString substringWithRange: NSMakeRange(2, 2)] integerValue] > 12 ||           // 12월을 넘어가면 에러
           [[inputString substringWithRange: NSMakeRange(6, 1)] integerValue] > 4 ||            // 뒷자리의 맨앞 숫자가 4를 초과하면 에러
           ([[inputString substringWithRange: NSMakeRange(2, 2)] integerValue] <= 12 && [[inputString substringWithRange: NSMakeRange(4, 2)] integerValue] > [[self class] getDaysOfYearMonth: [[inputString substringWithRange: NSMakeRange(2, 2)] integerValue]]) ||                        // 12월 이하이면서 날짜가 월의 최대일을 넘어가면 에러, ex) 1월 32일 에러
           [[inputString substringWithRange: NSMakeRange(12, 1)] integerValue] != temp)         // 비교 값이 다르면 에러
            msgString = @"올바르지 못한 주민등록번호 입니다";   // 위 조건이 거짓이라면 msgString 인스턴스 변수에 문자열 저장
        else
            msgString = @"올바른 주민등록번호 입니다";        // 아래 조건이 참이라면 msgString 인스턴스 변수에 문자열 저장
    }
    UIAlertView *alertErrorMsg = [[UIAlertView alloc] initWithTitle:@""             // UIAlertView 타이틀 지정하는 메서드
                                                            message:msgString       // 출력할 내용을 지정하는 메서드
                                                           delegate:nil
                                                  cancelButtonTitle:@"확인"          // 버튼의 텍스트를 지정하는 메서드
                                                  otherButtonTitles:nil, nil];
    [alertErrorMsg show];                                                           // UIAlertView 출력
}

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
