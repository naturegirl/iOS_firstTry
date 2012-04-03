//
//  Question.h
//  firstTry
//
//  Created by Jenny on 3/25/12.
//  Copyright (c) 2012 Tsinghua University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject {
    int countQuestions;     // number of questions answered so far
    int maxQuestions;     // numbers of questions per each set
    int right;          // number of right questions
    int wrong;          // number of wrong questions
}
- (Question *) init;
- (void) reset;     // called after a set is finished
- (void) right;     // when selected right answer
- (void) wrong;     // when selected wrong answer
- (NSString *) countLabel;  // label that shows questions answered and questions left
- (NSString *) rightwrongLabel; // label that shows right and wrong questions answered
- (Boolean) isSetFinished;  // returns True if the Set with maxQuestions has been answered
- (int) getScore;       // get score based on right
@end
