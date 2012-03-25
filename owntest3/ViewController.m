#import "ViewController.h"
#import "Question.h"
#import <stdlib.h>

@implementation ViewController
@synthesize label2;
@synthesize numQuestions;
@synthesize rightwrong;
@synthesize imageView;
@synthesize answer4;
@synthesize answer3;
@synthesize answer2;
@synthesize answer1;
@synthesize label;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    question = [[Question alloc] init];
    [self newQuestion]; // first question
    [self updateLabels];
    self.label2.text = nil;
}

- (void)viewDidUnload
{
    [self setLabel:nil];
    [self setAnswer1:nil];
    [self setAnswer2:nil];
    [self setAnswer3:nil];
    [self setAnswer4:nil];
    [self setImageView:nil];
    [self setNumQuestions:nil];
    [self setRightwrong:nil];
    [self setLabel2:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (int)getWrongAnswer:(int)answer {
    int num;
    while ((num = arc4random() % 17 + 2) == answer)    // 2 ~ 18
        ;
    return num;
}

// gets the numbers for the 4 answer buttons. One of them is the right one.
- (int *)getAnswerArray:(int)correctAnswer {
    int* answers = (int *)malloc(4*sizeof(int));    // first try C style
    answers[0] = [self getWrongAnswer:correctAnswer];
    while ((answers[1] = [self getWrongAnswer:correctAnswer]) == answers[0])
        ;
    while ((answers[2] = [self getWrongAnswer:correctAnswer]) == answers[1] || answers[2] == answers[0])
        ;
    while ((answers[3] = [self getWrongAnswer:correctAnswer]) == answers[2] || answers[2] == answers[1]
            || answers[2] == answers[0])
        ;
    int pos = arc4random() % 4; // position of correctAnswer
    posCorrect = pos;
    answers[pos] = correctAnswer;
    return answers;
}

- (IBAction)clickAnswer1:(id)sender {
    [self handleAnswerClick:0];
    [self newQuestion];
    [self updateLabels];
}
- (IBAction)clickAnswer2:(id)sender {
    [self handleAnswerClick:1];
    [self newQuestion];
    [self updateLabels];    
}
- (IBAction)clickAnswer3:(id)sender {
    [self handleAnswerClick:2];
    [self newQuestion];
    [self updateLabels];
}
- (IBAction)clickAnswer4:(id)sender {
    [self handleAnswerClick:3];
    [self newQuestion];
    [self updateLabels];
}
// handles the click on one of the four answer buttons
- (void)handleAnswerClick:(int)buttonNumber {
    if (posCorrect == buttonNumber) {
        self.label2.text = @"correct!";
        [self showImage:1];
        [question right];
    }
    else {
        self.label2.text = @"wrong...";
        [self showImage:2];
        [question wrong];
    }
}

// to show a new question. Called after an answer has been selected
- (void)newQuestion {
    // gets numbers
    int num1 = arc4random() % 9 + 1;    // 1 ~ 9
    int num2 = arc4random() % 9 + 1; 
    
    // gets answers
    int correctAnswer = num1+num2;
    int* answers = [self getAnswerArray:correctAnswer];
    
    // sets UI
    NSString* text = [NSString stringWithFormat:@"%d + %d = ?", num1, num2];
    self.label.text = text;
    
    UIButton* b[4];
    [b[0] setSelected:true];
    b[0] = self.answer1;
    b[1] = self.answer2;
    b[2] = self.answer3;
    b[3] = self.answer4;
    for (int i = 0; i < 4; ++i)
        [b[i] setTitle:[NSString stringWithFormat:@"%d", answers[i]] forState:UIControlStateNormal];
}
// show image, num specifies which image
// for now 1 -> happy, 2 -> sad
- (void)showImage:(int)num {
    // image test
    UIImage *img;
    switch (num) {
        case 1:
            img = [UIImage imageNamed:@"smiley_happy.png"];
            break;
        case 2:
            img = [UIImage imageNamed:@"smiley_sad.png"];
            break;
        default:
            break;
    }
    [self.imageView setImage:img];  
}
// update labels for number of questions and right wrong answers
- (void)updateLabels {
    self.numQuestions.text = [question countLabel];
    self.rightwrong.text = [question rightwrongLabel];
}


@end
