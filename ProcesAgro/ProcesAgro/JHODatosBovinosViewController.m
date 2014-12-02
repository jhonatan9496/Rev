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
    
    //Validar entrada de datos
    [menor1Bovinos setDelegate:self];
    [entre12Bovinos setDelegate:self];
    [entre23Bovinos setDelegate:self];
    [mayores3Bovinos setDelegate:self];

    
    //Boton avanzar con metodo accion avanzar
    //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(avanzar:)];
    
    UIBarButtonItem*avanzar=[[UIBarButtonItem alloc] initWithTitle:@"Avanzar" style:UIBarButtonItemStylePlain target:self action:@selector(avanzar:)];
    
    self.navigationItem.rightBarButtonItem=avanzar;
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
    
        
        
        if ([menor1Bovinos.text isEqualToString:@""]){
            [appDelegate.tramiteDiccionario setObject:@"0" forKey:@"menor1Bovinos"];
        }else{
             [appDelegate.tramiteDiccionario setObject:menor1Bovinos.text forKey:@"menor1Bovinos"];
        }
        
        if ([entre12Bovinos.text isEqualToString:@""]){
            [appDelegate.tramiteDiccionario setObject:@"0" forKey:@"entre12Bovinos"];
        }else{
            [appDelegate.tramiteDiccionario setObject:entre12Bovinos.text forKey:@"entre12Bovinos"];
        }
        
        if ([entre23Bovinos.text isEqualToString:@""]){
            [appDelegate.tramiteDiccionario setObject:@"0" forKey:@"entre23Bovinos"];
        }else{
            [appDelegate.tramiteDiccionario setObject:entre23Bovinos.text forKey:@"entre23Bovinos"];
        }
        
        if ([mayores3Bovinos.text isEqualToString:@""]){
            [appDelegate.tramiteDiccionario setObject:@"0" forKey:@"mayores3Bovinos"];
        }else{
            [appDelegate.tramiteDiccionario setObject:mayores3Bovinos.text forKey:@"mayores3Bovinos"];
        }

    //------------------------------------------------------------
    //--------------Agregmos datos al vector--------------------
    //------------------------------------------------------------
   
    
    NSLog(@"diccionario %@", appDelegate.tramiteDiccionario);
// abrimos nueva vista
    
    JHODatosBufalinosViewController  *cadaConvocatoria = [self.storyboard instantiateViewControllerWithIdentifier:@"Bufalinos"];
    [self.navigationController pushViewController:cadaConvocatoria animated:YES];
    
    
}

//----------------------------------------------------
//          Metodos Tecclado mayor 3 años
//----------------------------------------------------


- (IBAction)begin:(id)sender {
//    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
//    [self.view setFrame:CGRectMake(appFrame.origin.x,-196,appFrame.size.width,appFrame.size.height)];
}

- (IBAction)salir:(id)sender {
//    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
//    
//    [self.view setFrame:CGRectMake(appFrame.origin.x,0,appFrame.size.width,appFrame.size.height)];
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


//---------------------------------------------------------------------------
//------------- CAMPOS DE RESTRICCION DE CARACTERES   ---------------------
//---------------------------------------------------------------------------


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if((textField == menor1Bovinos && [[textField text] length] - range.length + string.length <= 3) || (textField == entre12Bovinos && [[textField text] length] - range.length + string.length <= 3) || (textField == entre23Bovinos&& [[textField text] length] - range.length + string.length <= 3)|| (textField == mayores3Bovinos&& [[textField text] length] - range.length + string.length <= 3))
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
