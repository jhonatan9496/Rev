//
//  JHODatosFincaYPropietarioViewController.m
//  ProcesAgro
//
//  Created by JHONATAN ACELAS AREVALO on 30/08/14.
//  Copyright (c) 2014 jhonatan. All rights reserved.
//

#import "JHODatosFincaYPropietarioViewController.h"
#import "JHODatosUbicacionViewController.h"
#import "JHOAppDelegate.h"

@interface JHODatosFincaYPropietarioViewController (){
    JHOAppDelegate *appDelegate ;
}

@end

@implementation JHODatosFincaYPropietarioViewController


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
    
    
    [ica3101 setDelegate:self];
    [nombreFinca setDelegate:self];
    [nombrePropietario setDelegate:self];
    [cedulaPropietario setDelegate:self];
    [fijoPropietario setDelegate:self];
    [celularPropietario setDelegate:self];
    [nombreVereda setDelegate:self];
    
    
    
    
    appDelegate = (JHOAppDelegate *) [[UIApplication sharedApplication]delegate];
    appDelegate.tramiteDiccionario = [[NSMutableDictionary alloc]init];
    // Do any additional setup after loading the view.
    
    
    [ica3101 setReturnKeyType: UIReturnKeyDone];
    
  //  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
 //  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    
 
    
}



//---------------------------------------------------------------------------
//------------- CAMPOS DE RESTRICCION DE CARACTERES   ---------------------
//---------------------------------------------------------------------------


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    // VALIDAR ICA
    
    if(textField == ica3101 && [[textField text] length] - range.length + string.length <= 10)
    {
        //return [[textField text] length] - range.length + string.length < 4;
        
        NSCharacterSet *invalidCharSet = [[NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:invalidCharSet] componentsJoinedByString:@""];
        
        return [string isEqualToString:filtered];
    }
    else if((textField == nombreFinca && [[textField text] length] - range.length + string.length <= 50) || (textField == nombrePropietario && [[textField text] length] - range.length + string.length <= 50)||(textField == nombreVereda && [[textField text] length] - range.length + string.length <= 50) )
    {
        NSCharacterSet *invalidCharSet = [[NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz "] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:invalidCharSet] componentsJoinedByString:@""];
        return [string isEqualToString:filtered];
    }
    else if((textField == cedulaPropietario && [[textField text] length] - range.length + string.length <= 11) || (textField == fijoPropietario && [[textField text] length] - range.length + string.length <= 11)|| (textField == celularPropietario && [[textField text] length] - range.length + string.length <= 10))
    {
        NSCharacterSet *invalidCharSet = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:invalidCharSet] componentsJoinedByString:@""];
        return [string isEqualToString:filtered];
    }
    else
        return NO;
    
    
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

//----------------------------------------------------
//          Metodos Tecclado celular edita
//----------------------------------------------------

- (IBAction)celularEdita:(id)sender {
    
        
}


- (IBAction)sitermina:(id)sender {
    
    [self resignFirstResponder];
}

//----------------------------------------------------
//          Metodos Tecclado telefono fijo
//----------------------------------------------------

- (IBAction)beginTelefonoFijo:(id)sender {
    
}

- (IBAction)salirTelefonoFijo:(id)sender {
    
    [self resignFirstResponder];
}
//----------------------------------------------------
//          Metodos Tecclado cedula
//----------------------------------------------------

- (IBAction)salirCedula:(id)sender {
    [self resignFirstResponder];
}
//----------------------------------------------------
//          Metodos Tecclado nombre
//----------------------------------------------------

- (IBAction)salirNombrePropietario:(id)sender {
    [self resignFirstResponder];
}
//----------------------------------------------------
//          Metodos Tecclado finca
//----------------------------------------------------

- (IBAction)salirNombreFinca:(id)sender {
     [self resignFirstResponder];
}
//----------------------------------------------------
//          Metodos Tecclado ica
//----------------------------------------------------

- (IBAction)salirIca:(id)sender {
     [ica3101 resignFirstResponder];
}

//----------------------------------------------------
//         Metodo guardar informacion avanzar
//----------------------------------------------------

- (IBAction)avanzarDatosFinca:(id)sender {
    
    // creamos un objeto del delegado para acceder a las variables
    
    /*
    JHOAppDelegate *appDelegate = (JHOAppDelegate *) [[UIApplication sharedApplication]delegate];
    appDelegate.tramiteVector = [NSMutableArray arrayWithObjects:@"cero",nil];
    // Agregamos la informacion de la vista3 al vector
    [appDelegate.tramiteVector addObject:ica3101.text];
    [appDelegate.tramiteVector addObject:nombreFinca.text];
    [appDelegate.tramiteVector addObject:nombrePropietario.text];
    [appDelegate.tramiteVector addObject:cedulaPropietario.text];
    [appDelegate.tramiteVector addObject:fijoPropietario.text];
    [appDelegate.tramiteVector addObject:celularPropietario.text];
    NSLog(@"Vector %@" ,appDelegate.tramiteVector);
    */


    //------------------------------------------------------------
    //--------------validar campos nulos --------------------
    //------------------------------------------------------------
    if ([ica3101.text isEqualToString:@""] || [nombreFinca.text isEqualToString:@""] ||[nombrePropietario.text isEqualToString:@""]||[cedulaPropietario.text isEqualToString:@""]||[fijoPropietario.text isEqualToString:@""]||[celularPropietario.text isEqualToString:@""] || [nombreVereda.text isEqualToString:@""]) {
        
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Alerta Campos Vacios " message:@"Existen campos Vacios. \n Complete todos los campos " delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [message show];
    }else {
        //------------------------------------------------------------
        //--------------Agregmos datos al diccionario--------------------
        //------------------------------------------------------------
        
     
        
    [appDelegate.tramiteDiccionario setObject:ica3101.text forKey:@"ica"];
    [appDelegate.tramiteDiccionario setObject:nombreFinca.text forKey:@"nombreFinca"];
    [appDelegate.tramiteDiccionario setObject:nombrePropietario.text forKey:@"nombrePropietario"];
    [appDelegate.tramiteDiccionario setObject:cedulaPropietario.text forKey:@"cedulaPropietario"];
    [appDelegate.tramiteDiccionario setObject:fijoPropietario.text forKey:@"fijoPropietario"];
    [appDelegate.tramiteDiccionario setObject:celularPropietario.text forKey:@"celularPropietario"];
    [appDelegate.tramiteDiccionario setObject:nombreVereda.text forKey:@"nombreVereda"];
    
    NSLog(@"diccionario %@", appDelegate.tramiteDiccionario);

    //------------------------------------------------------
    //-------------lanzar siguiente vista---------------------
    //------------------------------------------------------
    JHODatosUbicacionViewController  *cadaConvocatoria = [self.storyboard instantiateViewControllerWithIdentifier:@"Ubicacion"];
    [self.navigationController pushViewController:cadaConvocatoria animated:YES];
    
    }
}

//------------------------------------------------------
//-------------Prueba Teclado---------------------
//------------------------------------------------------


/*

- (void)keyboardDidShow:(NSNotification *)notification
{
    //Assign new frame to your view
    
    [self.view setFrame:CGRectMake(0,-230,320,460)]; //here taken -20 for example i.e. your view will be scrolled to -20. change its value according to your requirement.
    
}

-(void)keyboardDidHide:(NSNotification *)notification
{
    [self.view setFrame:CGRectMake(0,0,320,460)];
}
*/

//------------------------------------------------------
//-------------Guardar todos  Teclado---------------------
//------------------------------------------------------

-(BOOL) textFieldShouldReturn: (UITextField *) textField {
    [self resignFirstResponder];
    return YES;
}




@end
