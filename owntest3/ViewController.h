

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    int posCorrect; // position of Correct Answer. From 0~3
    id question;
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
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *numQuestions; // display number of questions
@property (weak, nonatomic) IBOutlet UILabel *rightwrong;   // display right and wrong answer count
@property (weak, nonatomic) IBOutlet UILabel *label2;

// my helper functions
- (int)getWrongAnswer:(int)answer;
- (int *)getAnswerArray:(int)correctAnswer;
- (void)handleAnswerClick:(int)buttonNumber;
- (void)newQuestion;
- (void)showImage:(int)num;
- (void)updateLabels;
- (void)showResult:(int)score; // show result in new view with score
@end
