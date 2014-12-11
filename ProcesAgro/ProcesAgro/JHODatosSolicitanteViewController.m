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
    
    //Validar entrada de datos
    [nombreSolicitante setDelegate:self];
    [cedulaSolicitante setDelegate:self];
    [fijoSolicitante setDelegate:self];
    [celularSolicitante setDelegate:self];
    
    //Boton avanzar con metodo accion avanzar
    //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(avanzar:)];
    
    
    //--------------------------------------------
    //      Volvemos a cargar datos si estan cargad
    //--------------------------------------------
    JHOAppDelegate *appDelegate = (JHOAppDelegate *) [[UIApplication sharedApplication]delegate];
    
    
    if ([appDelegate.tramiteDiccionario objectForKey:@"ica"]){
        NSLog(@"dato guardadp");
        nombreSolicitante.text=[appDelegate.tramiteDiccionario objectForKey:@"nombreSolicitante"];
    }
    
    if ([appDelegate.tramiteDiccionario objectForKey:@"ica"]){
        NSLog(@"dato guardadp");
        cedulaSolicitante.text=[appDelegate.tramiteDiccionario objectForKey:@"cedulaSolicitante"];
    }
    
    if ([appDelegate.tramiteDiccionario objectForKey:@"ica"]){
        NSLog(@"dato guardadp");
        fijoSolicitante.text=[appDelegate.tramiteDiccionario objectForKey:@"fijoSolicitante"];
    }
    
    if ([appDelegate.tramiteDiccionario objectForKey:@"ica"]){
        NSLog(@"dato guardadp");
        celularSolicitante.text=[appDelegate.tramiteDiccionario objectForKey:@"celularSolicitante"];
    }
    //--------------------------------------------
    //     FIN  Volvemos a cargar datos si estan cargad
    //--------------------------------------------
    
    
    
    UIBarButtonItem*avanzar=[[UIBarButtonItem alloc] initWithTitle:@"Avanzar" style:UIBarButtonItemStylePlain target:self action:@selector(avanzar:)];
    
    self.navigationItem.rightBarButtonItem=avanzar;
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
        
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Alerta Campos Vacios" message:@"Existen campos Vacios. \n Complete todos los campos  para continuar con su tramite" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [message show];
    }
    else if ([nombreSolicitante.text length]<7){
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Alerta Campo Nombre Solicitante" message:@"El campo debe tener minimo 7 caracteres y maximo 50 " delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [message show];
    }
    else if ([cedulaSolicitante.text length]<7){
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Alerta Campo Cedula Solicitante" message:@"El campo debe tener minimo 7 caracteres y maximo 10 " delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [message show];
    }
    else if ([fijoSolicitante.text length]<6){
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Alerta Campo Fijo Solicitante" message:@"El campo debe tener minimo 6 caracteres y maximo 10 " delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [message show];
    }
    else if ([celularSolicitante.text length]<10){
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Alerta Campo Celular Solicitante" message:@"El campo debe tener 10 caracteres. " delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [message show];
    }
    else {

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


- (IBAction)salirnombresol:(id)sender {
     [self resignFirstResponder];
}

- (IBAction)salirCedSol:(id)sender {
     [self resignFirstResponder];
}

- (IBAction)salirFijoSol:(id)sender {
     [self resignFirstResponder];
}

- (IBAction)salirCelSol:(id)sender {
     [self resignFirstResponder];
}



//---------------------------------------------------------------------------
//------------- CAMPOS DE RESTRICCION DE CARACTERES   ---------------------
//---------------------------------------------------------------------------


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    // VALIDAR ICA
    if(textField == nombreSolicitante && [[textField text] length] - range.length + string.length <= 50)
    {
        NSCharacterSet *invalidCharSet = [[NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzñáéíóú "] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:invalidCharSet] componentsJoinedByString:@""];
        return [string isEqualToString:filtered];
    }
    else if((textField == celularSolicitante && [[textField text] length] - range.length + string.length <= 10) || (textField == fijoSolicitante && [[textField text] length] - range.length + string.length <= 10) || (textField == cedulaSolicitante&& [[textField text] length] - range.length + string.length <= 10))
    {
        NSCharacterSet *invalidCharSet = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:invalidCharSet] componentsJoinedByString:@""];
        return [string isEqualToString:filtered];
    }
    else
        return NO;
    
    
}

//------------------------------------------------------
//-------------Guardar todos  Teclado---------------------
//------------------------------------------------------

-(BOOL) textFieldShouldReturn: (UITextField *) textField {
    [self resignFirstResponder];
    return YES;
}




@end
