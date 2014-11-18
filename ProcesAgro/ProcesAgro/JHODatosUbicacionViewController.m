//
//  JHODatosUbicacionViewController.m
//  ProcesAgro
//
//  Created by JHONATAN ACELAS AREVALO on 30/08/14.
//  Copyright (c) 2014 jhonatan. All rights reserved.
//

#import "JHODatosUbicacionViewController.h"
#import "JHODatosSolicitanteViewController.h"
#import "JHOAppDelegate.h"

@interface JHODatosUbicacionViewController ()

@end

@implementation JHODatosUbicacionViewController

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
    
    [municipio setDelegate:self];
    [departamento setDelegate:self];
    
    //Boton avanzar con metodo accion avanzar
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(avanzar:)];
    //titulo
    self.navigationItem.title = @"Ubicacion";
    
    
    
    
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
    [appDelegate.tramiteVector addObject:municipio.text];
    [appDelegate.tramiteVector addObject:departamento.text];
    NSLog(@"Vector %@" ,appDelegate.tramiteVector);
    */
    
    //------------------------------------------------------------
    //--------------validar campos nulos --------------------
    //------------------------------------------------------------
    if ([municipio.text isEqualToString:@""]||[departamento.text isEqualToString:@""]||[municipio.text length]>15||[departamento.text length]>15) {
        
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Alerta Campos Vacios o Demaciado largos" message:@"Existen campos Vacios o Demaciado Largos. \n Complete todos los campos ó verifique  que la informacion sea correcta para continuar con su tramite" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [message show];
    }else {
        //------------------------------------------------------------
        //--------------Agregmos datos al diccionario--------------------
        //------------------------------------------------------------
    [appDelegate.tramiteDiccionario setObject:municipio.text forKey:@"municipio"];
    [appDelegate.tramiteDiccionario setObject:departamento.text forKey:@"departamento"];
    
    NSLog(@"diccionario %@", appDelegate.tramiteDiccionario);

    JHODatosSolicitanteViewController  *cadaConvocatoria = [self.storyboard instantiateViewControllerWithIdentifier:@"Solicitante"];
    [self.navigationController pushViewController:cadaConvocatoria animated:YES];
        
    }
    
}

- (IBAction)salirMunicipio:(id)sender {
    [self resignFirstResponder];
}

- (IBAction)salirDepto:(id)sender {
    [self resignFirstResponder];
}





//---------------------------------------------------------------------------
//------------- CAMPOS DE RESTRICCION DE CARACTERES   ---------------------
//---------------------------------------------------------------------------


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    // VALIDAR ICA
    if(textField == municipio || textField == departamento)
    {
        NSCharacterSet *invalidCharSet = [[NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:invalidCharSet] componentsJoinedByString:@""];
        return [string isEqualToString:filtered];
    }
    
    else
        return YES;
    
    
}

//------------------------------------------------------
//-------------Guardar todos  Teclado---------------------
//------------------------------------------------------

-(BOOL) textFieldShouldReturn: (UITextField *) textField {
    [self resignFirstResponder];
    return YES;
}


@end
