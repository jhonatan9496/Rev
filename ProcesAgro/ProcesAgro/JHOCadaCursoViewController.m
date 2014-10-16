//
//  JHOCadaCursoViewController.m
//  ProcesAgro
//
//  Created by JHONATAN ACELAS AREVALO on 16/10/14.
//  Copyright (c) 2014 jhonatan. All rights reserved.
//

#import "JHOCadaCursoViewController.h"
#import "JHOServiciosViewController.h"

@interface JHOCadaCursoViewController ()

@end

@implementation JHOCadaCursoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_tituloCurso setText:_textTituloCurso];
    [_descripcionCurso setText:_textDeescripcionCurso];
    self.navigationItem.title = @"Curso";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)linkWebCurso:(id)sender {
    JHOServiciosViewController  *cadaConvocatoria = [self.storyboard instantiateViewControllerWithIdentifier:@"UrlServicios"];
    [self.navigationController pushViewController:cadaConvocatoria animated:YES];
    cadaConvocatoria.urlCargar=_textLinkCurso;
}

- (IBAction)postFace:(id)sender {
    
    post = [[SLComposeViewController alloc] init];
    post = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [post setInitialText:@"Estoy recibiendo información de convocatorias y tramites  del gobierno por la app ProcesAgro "];
    [self presentViewController:post animated:YES completion:NULL];
}

- (IBAction)postTwit:(id)sender {
    post = [[SLComposeViewController alloc] init];
    post = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [post setInitialText:@"Estoy recibiendo información de convocatorias y tramites  del gobierno por la app ProcesAgro"];
    [self presentViewController:post animated:YES completion:NULL];
}
@end
