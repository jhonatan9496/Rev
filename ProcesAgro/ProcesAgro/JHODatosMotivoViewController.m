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
    
    
    [primeraVez setDelegate:self];
    [nacimiento setDelegate:self];
    [compra setDelegate:self];
    [perdidaDIN setDelegate:self];
    
    //Boton avanzar con metodo accion avanzar
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(avanzar:)];
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
    
    int ani =[[appDelegate.tramiteDiccionario objectForKey:@"menor1Bovinos"] integerValue]+
    [[appDelegate.tramiteDiccionario objectForKey:@"entre12Bovinos"] integerValue]+
    [[appDelegate.tramiteDiccionario objectForKey:@"entre23Bovinos"] integerValue]+
    [[appDelegate.tramiteDiccionario objectForKey:@"mayores3Bovinos"] integerValue]+
    
    [[appDelegate.tramiteDiccionario objectForKey:@"menor1Bufalino"] integerValue]+
    [[appDelegate.tramiteDiccionario objectForKey:@"entre12Bufalino"] integerValue]+
    [[appDelegate.tramiteDiccionario objectForKey:@"entre23Bufalino"] integerValue]+
    [[appDelegate.tramiteDiccionario objectForKey:@"mayor3Bufalino"] integerValue];
    
    int mot = [primeraVez.text integerValue]+[nacimiento.text integerValue]+[compra.text integerValue]+[perdidaDIN.text integerValue];
    
    if ( ani==mot) {
    
    
    //------------------------------------------------------------
    //--------------validar campos nulos --------------------
    //------------------------------------------------------------
    if ([primeraVez.text isEqualToString:@""] || [nacimiento.text isEqualToString:@""] ||[compra.text isEqualToString:@""]||[perdidaDIN.text isEqualToString:@""]) {
        
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Alerta Campos Vacios" message:@"Existen campos Vacios. \n Debe escribir 0 en los campos que no va a identificar animales" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [message show];
    }else {

        
    [appDelegate.tramiteDiccionario setObject:primeraVez.text forKey:@"primeraVez"];
    [appDelegate.tramiteDiccionario setObject:nacimiento.text forKey:@"nacimiento"];
    [appDelegate.tramiteDiccionario setObject:compra.text forKey:@"compra"];
    [appDelegate.tramiteDiccionario setObject:perdidaDIN.text forKey:@"perdidaDIN"];
    
    NSLog(@"diccionario %@", appDelegate.tramiteDiccionario);

    
    JHODatosMotivoViewController  *cadaConvocatoria = [self.storyboard instantiateViewControllerWithIdentifier:@"Enviar"];
    [self.navigationController pushViewController:cadaConvocatoria animated:YES];
    }
    }else{
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Alerta Motivo" message:@"El numero de animales  a identificar no es igual al numero de motivo de identificacion. \n Debe comprobar que la suma de bovinos y bufalinos sea igual a la suma de animales a identificar" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [message show];
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

//----------------------------------------------------
//          Metodos Tecclado mayor 3 años
//----------------------------------------------------


- (IBAction)begin:(id)sender {
//    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
//    [self.view setFrame:CGRectMake(appFrame.origin.x,-196,appFrame.size.width,appFrame.size.height)];
}

- (IBAction)salirdin:(id)sender {
//    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
//    
//    [self.view setFrame:CGRectMake(appFrame.origin.x,0,appFrame.size.width,appFrame.size.height)];
    [self resignFirstResponder];
}

- (IBAction)salirCompra:(id)sender {
    [self resignFirstResponder];
}

- (IBAction)salirNacimiento:(id)sender {
    [self resignFirstResponder];
}

- (IBAction)salirprimer:(id)sender {
    [self resignFirstResponder];
}

//---------------------------------------------------------------------------
//------------- CAMPOS DE RESTRICCION DE CARACTERES   ---------------------
//---------------------------------------------------------------------------


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if((textField == primeraVez && [[textField text] length] - range.length + string.length <= 3) || (textField == nacimiento && [[textField text] length] - range.length + string.length <= 3) || (textField == compra&& [[textField text] length] - range.length + string.length <= 3)|| (textField == perdidaDIN&& [[textField text] length] - range.length + string.length <= 3))
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
