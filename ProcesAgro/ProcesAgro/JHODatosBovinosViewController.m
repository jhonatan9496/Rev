//
//  JHODatosBovinosViewController.m
//  ProcesAgro
//
//  Created by JHONATAN ACELAS AREVALO on 30/08/14.
//  Copyright (c) 2014 jhonatan. All rights reserved.
//

#import "JHODatosBovinosViewController.h"
#import "JHOAppDelegate.h"
#import "JHODatosBufalinosViewController.h"

@interface JHODatosBovinosViewController ()

@end

@implementation JHODatosBovinosViewController

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
    self.navigationItem.title = @"Bovinos";
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
    [appDelegate.tramiteVector addObject:menor1Bovinos.text];
    [appDelegate.tramiteVector addObject:entre12Bovinos.text];
    [appDelegate.tramiteVector addObject:entre23Bovinos.text];
    [appDelegate.tramiteVector addObject:mayores3Bovinos.text];
    NSLog(@"Vector %@" ,appDelegate.tramiteVector);
    */
    
    
    //------------------------------------------------------------
    //--------------validar campos nulos --------------------
    //------------------------------------------------------------
    if ([menor1Bovinos.text isEqualToString:@""] || [entre12Bovinos.text isEqualToString:@""] ||[entre23Bovinos.text isEqualToString:@""]||[mayores3Bovinos.text isEqualToString:@""]||[menor1Bovinos.text length]>3||[entre12Bovinos.text length]>3||[entre23Bovinos.text length]>3||[mayores3Bovinos.text length]>3) {
        
       UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Alerta Campos Vacios o Demaciado largos" message:@"Existen campos Vacios o Demaciado Largos. \n Complete todos los campos ó verifique  que la informacion sea correcta para continuar con su tramite" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [message show];
    }else {

    //------------------------------------------------------------
    //--------------Agregmos datos al vector--------------------
    //------------------------------------------------------------
    [appDelegate.tramiteDiccionario setObject:menor1Bovinos.text forKey:@"menor1Bovinos"];
    [appDelegate.tramiteDiccionario setObject:entre12Bovinos.text forKey:@"entre12Bovinos"];
    [appDelegate.tramiteDiccionario setObject:entre23Bovinos.text forKey:@"entre23Bovinos"];
    [appDelegate.tramiteDiccionario setObject:mayores3Bovinos.text forKey:@"mayores3Bovinos"];
    
    NSLog(@"diccionario %@", appDelegate.tramiteDiccionario);

    
    JHODatosBufalinosViewController  *cadaConvocatoria = [self.storyboard instantiateViewControllerWithIdentifier:@"Bufalinos"];
    [self.navigationController pushViewController:cadaConvocatoria animated:YES];
    }
    
}

//----------------------------------------------------
//          Metodos Tecclado mayor 3 años
//----------------------------------------------------


- (IBAction)begin:(id)sender {
    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
    [self.view setFrame:CGRectMake(appFrame.origin.x,-196,appFrame.size.width,appFrame.size.height)];
}

- (IBAction)salir:(id)sender {
    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
    
    [self.view setFrame:CGRectMake(appFrame.origin.x,0,appFrame.size.width,appFrame.size.height)];
    [self resignFirstResponder];
}

- (IBAction)salir23:(id)sender {
     [self resignFirstResponder];
}

- (IBAction)salir12:(id)sender {
     [self resignFirstResponder];
}

- (IBAction)salir1:(id)sender {
     [self resignFirstResponder];
}
@end
