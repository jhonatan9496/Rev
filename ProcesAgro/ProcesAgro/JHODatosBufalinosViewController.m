//
//  JHODatosBufalinosViewController.m
//  ProcesAgro
//
//  Created by JHONATAN ACELAS AREVALO on 30/08/14.
//  Copyright (c) 2014 jhonatan. All rights reserved.
//

#import "JHODatosBufalinosViewController.h"
#import "JHOAppDelegate.h"
#import "JHODatosMotivoViewController.h"

@interface JHODatosBufalinosViewController ()

@end

@implementation JHODatosBufalinosViewController

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
    
    [menor1Bufalino setDelegate:self];
    [entre12Bufalino setDelegate:self];
    [entre23Bufalino setDelegate:self];
    [mayor3Bufalino setDelegate:self];
    //Boton avanzar con metodo accion avanzar
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(avanzar:)];
    //titulo
    self.navigationItem.title = @"Bufalinos";

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
    [appDelegate.tramiteVector addObject:menor1Bufalino.text];
    [appDelegate.tramiteVector addObject:entre12Bufalino.text];
    [appDelegate.tramiteVector addObject:entre23Bufalino.text];
    [appDelegate.tramiteVector addObject:mayor3Bufalino.text];
    NSLog(@"Vector %@" ,appDelegate.tramiteVector);
    */
    
    int resultado =[[appDelegate.tramiteDiccionario objectForKey:@"menor1Bovinos"] integerValue]+
    [[appDelegate.tramiteDiccionario objectForKey:@"entre12Bovinos"] integerValue]+
    [[appDelegate.tramiteDiccionario objectForKey:@"entre23Bovinos"] integerValue]+
    [[appDelegate.tramiteDiccionario objectForKey:@"mayores3Bovinos"] integerValue]+
    [menor1Bufalino.text integerValue]+
    [entre12Bufalino.text integerValue]+
    [entre23Bufalino.text integerValue]+
    [mayor3Bufalino.text integerValue];
    
    if ( resultado> 0) {
        
    //------------------------------------------------------------
    //--------------validar campos nulos --------------------
    //------------------------------------------------------------
    if ([menor1Bufalino.text isEqualToString:@""] || [entre12Bufalino.text isEqualToString:@""] ||[entre23Bufalino.text isEqualToString:@""]||[mayor3Bufalino.text isEqualToString:@""]) {
        
       UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Alerta Campos Vacios" message:@"Existen campos Vacios. \n Debe escribir 0 en los campos que no va a identificar animales" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [message show];
    }else {

    
    [appDelegate.tramiteDiccionario setObject:menor1Bufalino.text forKey:@"menor1Bufalino"];
    [appDelegate.tramiteDiccionario setObject:entre12Bufalino.text forKey:@"entre12Bufalino"];
    [appDelegate.tramiteDiccionario setObject:entre23Bufalino.text forKey:@"entre23Bufalino"];
    [appDelegate.tramiteDiccionario setObject:mayor3Bufalino.text forKey:@"mayor3Bufalino"];
    
    NSLog(@"diccionario %@", appDelegate.tramiteDiccionario);

    
    JHODatosMotivoViewController  *cadaConvocatoria = [self.storyboard instantiateViewControllerWithIdentifier:@"Motivo"];
    [self.navigationController pushViewController:cadaConvocatoria animated:YES];
    }
    }else {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Alerta 0 a Identificar" message:@"Para poder enviar el tramite almenos debe identificar 1 animal" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [message show];
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



- (IBAction)begin3:(id)sender {
//    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
//    [self.view setFrame:CGRectMake(appFrame.origin.x,-196,appFrame.size.width,appFrame.size.height)];
}

- (IBAction)salir3:(id)sender {
//    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
//    
//    [self.view setFrame:CGRectMake(appFrame.origin.x,0,appFrame.size.width,appFrame.size.height)];
    [self resignFirstResponder];
}

- (IBAction)salir1:(id)sender {
     [self resignFirstResponder];
}

- (IBAction)salir12:(id)sender {
     [self resignFirstResponder];
}

- (IBAction)salir23:(id)sender {
     [self resignFirstResponder];
}


//---------------------------------------------------------------------------
//------------- CAMPOS DE RESTRICCION DE CARACTERES   ---------------------
//---------------------------------------------------------------------------


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if((textField == menor1Bufalino && [[textField text] length] - range.length + string.length <= 3) || (textField == entre12Bufalino && [[textField text] length] - range.length + string.length <= 3) || (textField == entre23Bufalino&& [[textField text] length] - range.length + string.length <= 3)|| (textField == mayor3Bufalino&& [[textField text] length] - range.length + string.length <= 3))
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
