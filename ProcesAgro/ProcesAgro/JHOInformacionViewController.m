//
//  JHOInformacionViewController.m
//  ProcesAgro
//
//  Created by JHONATAN ACELAS AREVALO on 23/08/14.
//  Copyright (c) 2014 jhonatan. All rights reserved.
//

#import "JHOInformacionViewController.h"

@interface JHOInformacionViewController ()

@end

@implementation JHOInformacionViewController

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
    self.navigationItem.title = @"Información";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)twitterJhonatan:(id)sender {
    post = [[SLComposeViewController alloc] init];
    post = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [post setInitialText:@"@jhonatanacelas @jessicacruza @tucompualdia "];
    [self presentViewController:post animated:YES completion:NULL];

}

- (IBAction)twitterJairo:(id)sender {
    post = [[SLComposeViewController alloc] init];
    post = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [post setInitialText:@"@jhonatanacelas @jessicacruza @tucompualdia "];
    [self presentViewController:post animated:YES completion:NULL];
}

- (IBAction)TwitterJessica:(id)sender {
    post = [[SLComposeViewController alloc] init];
    post = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [post setInitialText:@"@jhonatanacelas @jessicacruza @tucompualdia "];
    [self presentViewController:post animated:YES completion:NULL];
}
@end
