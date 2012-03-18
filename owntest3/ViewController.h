

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    int posCorrect; // position of Correct Answer. From 0~3
    
}
- (IBAction)clickAnswer4:(id)sender;
- (IBAction)clickAnswer2:(id)sender;
- (IBAction)clickAnswer1:(id)sender;
- (IBAction)clickAnswer3:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *answer4;
@property (weak, nonatomic) IBOutlet UIButton *answer3;
@property (weak, nonatomic) IBOutlet UIButton *answer2;
@property (weak, nonatomic) IBOutlet UIButton *answer1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label;

// my helper functions
- (int)getWrongAnswer:(int)answer;
- (int *)getAnswerArray:(int)correctAnswer;
- (void)handleAnswerClick:(int)buttonNumber;
- (void)newQuestion;
- (void)showImage:(int)num;
- (void)playSound:(int)num;
@end
