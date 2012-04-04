//
//  VC_Result.h
//  firstTry
//
//  Created by Jenny on 4/3/12.
//  Copyright (c) 2012 Tsinghua University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VC_Result : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UILabel *score;

- (IBAction)onClick:(id)sender;

@end
