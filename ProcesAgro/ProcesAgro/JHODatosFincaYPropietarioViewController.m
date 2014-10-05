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
    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(400, 400)];
    
    
    appDelegate = (JHOAppDelegate *) [[UIApplication sharedApplication]delegate];
    appDelegate.tramiteDiccionario = [[NSMutableDictionary alloc]init];
    // Do any additional setup after loading the view.
    
    
    [ica3101 setReturnKeyType: UIReturnKeyDone];
    
  //  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
 //  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    
 
    
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
    
    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
   [self.view setFrame:CGRectMake(appFrame.origin.x,-196,appFrame.size.width,appFrame.size.height)];
    
}


- (IBAction)sitermina:(id)sender {
    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
    
    [self.view setFrame:CGRectMake(appFrame.origin.x,0,appFrame.size.width,appFrame.size.height)];
    [self resignFirstResponder];
}

//----------------------------------------------------
//          Metodos Tecclado telefono fijo
//----------------------------------------------------

- (IBAction)beginTelefonoFijo:(id)sender {
    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
    [self.view setFrame:CGRectMake(appFrame.origin.x,-196,appFrame.size.width,appFrame.size.height)];
    
}

- (IBAction)salirTelefonoFijo:(id)sender {
    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
    
    [self.view setFrame:CGRectMake(appFrame.origin.x,0,appFrame.size.width,appFrame.size.height)];
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
     [self resignFirstResponder];
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
    if ([ica3101.text isEqualToString:@""] || [nombreFinca.text isEqualToString:@""] ||[nombrePropietario.text isEqualToString:@""]||[cedulaPropietario.text isEqualToString:@""]||[fijoPropietario.text isEqualToString:@""]||[celularPropietario.text isEqualToString:@""]) {
        
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Alerta Campos Vacios" message:@"Existen campos Vacios. \n Complete todos los campos para continuar con su tramite" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [message show];
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



@end
