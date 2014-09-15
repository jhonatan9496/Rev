//
//  JHODatosSolicitanteViewController.m
//  ProcesAgro
//
//  Created by JHONATAN ACELAS AREVALO on 30/08/14.
//  Copyright (c) 2014 jhonatan. All rights reserved.
//

#import "JHODatosSolicitanteViewController.h"
#import "JHOAppDelegate.h"
#import "JHODatosBovinosViewController.h"

@interface JHODatosSolicitanteViewController ()

@end

@implementation JHODatosSolicitanteViewController

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
    
    //Boton avanzar con metodo accion avanzar
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(avanzar:)];
    //titulo
    self.navigationItem.title = @"Solicitante";
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



- (IBAction)avanzar:(id)sender {
    
    // creamos un objeto del delegado para acceder a las variables
    JHOAppDelegate *appDelegate = (JHOAppDelegate *) [[UIApplication sharedApplication]delegate];
    /*
    // Agregamos la informacion de la vista3 al vector
    [appDelegate.tramiteVector addObject:nombreSolicitante.text];
    [appDelegate.tramiteVector addObject:cedulaSolicitante.text];
    [appDelegate.tramiteVector addObject:fijoSolicitante.text];
    [appDelegate.tramiteVector addObject:celularSolicitante.text];
    NSLog(@"Vector %@" ,appDelegate.tramiteVector);
    */
    
    //------------------------------------------------------------
    //--------------validar campos nulos --------------------
    //------------------------------------------------------------
    if ([nombreSolicitante.text isEqualToString:@""] || [cedulaSolicitante.text isEqualToString:@""] ||[fijoSolicitante.text isEqualToString:@""]||[celularSolicitante.text isEqualToString:@""]) {
        
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Alerta Campos Vacios" message:@"Existen campos Vacios. \n Complete todos los campos para continuar con su tramite" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [message show];
    }else {

    //------------------------------------------------------------
    //--------------Agregmos datos al vector--------------------
    //------------------------------------------------------------
    [appDelegate.tramiteDiccionario setObject:nombreSolicitante.text forKey:@"nombreSolicitante"];
    [appDelegate.tramiteDiccionario setObject:cedulaSolicitante.text forKey:@"cedulaSolicitante"];
    [appDelegate.tramiteDiccionario setObject:fijoSolicitante.text forKey:@"fijoSolicitante"];
    [appDelegate.tramiteDiccionario setObject:celularSolicitante.text forKey:@"celularSolicitante"];
    
    NSLog(@"diccionario %@", appDelegate.tramiteDiccionario);

    JHODatosBovinosViewController  *cadaConvocatoria = [self.storyboard instantiateViewControllerWithIdentifier:@"Bovinos"];
    [self.navigationController pushViewController:cadaConvocatoria animated:YES];
        
    }
    
}


@end
