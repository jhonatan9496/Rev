//
//  JHOServiciosViewController.m
//  ProcesAgro
//
//  Created by JHONATAN ACELAS AREVALO on 30/08/14.
//  Copyright (c) 2014 jhonatan. All rights reserved.
//

#import "JHOServiciosViewController.h"

@interface JHOServiciosViewController ()

@end

@implementation JHOServiciosViewController

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
    [self cargarurl];
    
    self.navigationItem.title = @"Web View";

    
    // Do any additional setup after loading the view.
}

-(void )cargarurl{
    NSURL *url = [NSURL URLWithString:_urlCargar];
    NSURLRequest *loadUrl = [[NSURLRequest alloc]initWithURL:url];
    [self.webView loadRequest:loadUrl];
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

@end
