//
//  Question.m
//  firstTry
//
//  Created by Jenny on 3/25/12.
//  Copyright (c) 2012 Tsinghua University. All rights reserved.
//

#import "Question.h"

@implementation Question
- (Question *) init
{
    self = [super init];
    if (self) {
        countQuestions = -1;    // first one displays 0
        maxQuestions = 10;  // Todo: constant declaration?
        right = wrong = 0;
    }
    return self;
}
- (void) reset {
    right = wrong = 0;
    countQuestions = -1;    // this way first one displays 0
}

- (NSString *) countLabel {
    countQuestions++;
    return [NSString stringWithFormat:@"%d/%d", countQuestions, maxQuestions];   // memory leak?
}

- (NSString *) rightwrongLabel {
    return [NSString stringWithFormat:@"Points: %d", right];
}

- (void) right {
    right++;
}
- (void) wrong {
    wrong++;
}

- (Boolean) isSetFinished
{
    return (countQuestions == maxQuestions) ? true : false;
}

- (int) getScore
{
    return right;
}
@end
