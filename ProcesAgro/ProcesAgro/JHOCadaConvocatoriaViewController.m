//
//  JHOCadaConvocatoriaViewController.m
//  ProcesAgro
//
//  Created by JHONATAN ACELAS AREVALO on 9/08/14.
//  Copyright (c) 2014 jhonatan. All rights reserved.
//

#import "JHOCadaConvocatoriaViewController.h"
#import "JHOServiciosViewController.h" 


@interface JHOCadaConvocatoriaViewController ()

@end

@implementation JHOCadaConvocatoriaViewController
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
    
    [_tituloCadaConvocatoria setText:_textTituloConvocatoria];
    [_descripcionCadaConvocatoria setText:_textDeescripcionConvocatoria];
    self.navigationItem.title = @"Convocatoria";
    // Do any additional setup after loading the view.
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

- (IBAction)abrirNavegador:(id)sender {
    //-------------------------------------------------
    // ---------abre navegador independinete-----------
    //-------------------------------------------------
    /*
    NSLog(@"link convocatoria %@",_textLinkConvocatoria);
    NSString *textURL = _textLinkConvocatoria;
    NSURL *cleanURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@", textURL]];
    [[UIApplication sharedApplication] openURL:cleanURL];
    */
    //-------------------------------------------------
    // ---------Crea la vista de servicio-----------
    //-------------------------------------------------
    JHOServiciosViewController  *cadaConvocatoria = [self.storyboard instantiateViewControllerWithIdentifier:@"UrlServicios"];
    [self.navigationController pushViewController:cadaConvocatoria animated:YES];
    cadaConvocatoria.urlCargar=_textLinkConvocatoria;

}

- (IBAction)postFacebook:(id)sender {
    
    post = [[SLComposeViewController alloc] init];
    post = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [post setInitialText:@"Estoy recibiendo información de convocatorias y tramites  del gobierno por la app ProcesAgro "];
    [self presentViewController:post animated:YES completion:NULL];
    
}

- (IBAction)postTwitter:(id)sender {
    post = [[SLComposeViewController alloc] init];
    post = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [post setInitialText:@"Estoy recibiendo información de convocatorias y tramites  del gobierno por la app ProcesAgro"];
    [self presentViewController:post animated:YES completion:NULL];
}
@end
