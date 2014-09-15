//
//  JHODatosMotivoViewController.m
//  ProcesAgro
//
//  Created by JHONATAN ACELAS AREVALO on 30/08/14.
//  Copyright (c) 2014 jhonatan. All rights reserved.
//

#import "JHODatosMotivoViewController.h"
#import "JHOAppDelegate.h"
#import "JHOJustificacionEnviarViewController.h" 
 
@interface JHODatosMotivoViewController ()

@end

@implementation JHODatosMotivoViewController

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
    self.navigationItem.title = @"Motivo";
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)avanzar:(id)sender {
    
    // creamos un objeto del delegado para acceder a las variables
    JHOAppDelegate *appDelegate = (JHOAppDelegate *) [[UIApplication sharedApplication]delegate];
    /*
    // Agregamos la informacion de la vista3 al vector
    [appDelegate.tramiteVector addObject:primeraVez.text];
    [appDelegate.tramiteVector addObject:nacimiento.text];
    [appDelegate.tramiteVector addObject:compra.text];
    [appDelegate.tramiteVector addObject:perdidaDIN.text];
    NSLog(@"Vector %@" ,appDelegate.tramiteVector);
    */
    
    //------------------------------------------------------------
    //--------------validar campos nulos --------------------
    //------------------------------------------------------------
    if ([primeraVez.text isEqualToString:@""] || [nacimiento.text isEqualToString:@""] ||[compra.text isEqualToString:@""]||[perdidaDIN.text isEqualToString:@""]) {
        
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Alerta Campos Vacios" message:@"Existen campos Vacios. \n Complete todos los campos para continuar con su tramite" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [message show];
    }else {

        
    [appDelegate.tramiteDiccionario setObject:primeraVez.text forKey:@"primeraVez"];
    [appDelegate.tramiteDiccionario setObject:nacimiento.text forKey:@"nacimiento"];
    [appDelegate.tramiteDiccionario setObject:compra.text forKey:@"compra"];
    [appDelegate.tramiteDiccionario setObject:perdidaDIN.text forKey:@"perdidaDIN"];
    
    NSLog(@"diccionario %@", appDelegate.tramiteDiccionario);

    
    JHODatosMotivoViewController  *cadaConvocatoria = [self.storyboard instantiateViewControllerWithIdentifier:@"Enviar"];
    [self.navigationController pushViewController:cadaConvocatoria animated:YES];
    }
    
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
