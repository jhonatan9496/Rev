//
//  JHOIdentificarIpadViewController.m
//  ProcesAgro
//
//  Created by JHONATAN ACELAS AREVALO on 13/09/14.
//  Copyright (c) 2014 jhonatan. All rights reserved.
//

#import "JHOIdentificarIpadViewController.h"
#import "JHOAppDelegate.h"
#import "JHOEnviarIpadViewController.h"

@interface JHOIdentificarIpadViewController ()

@end

@implementation JHOIdentificarIpadViewController

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
    
    [menor1Bovinos setDelegate:self];
    [entre12Bovinos setDelegate:self];
    [entre23Bovinos setDelegate:self];
    [mayores3Bovinos setDelegate:self];
    
    [menor1Bufalino setDelegate:self];
    [entre12Bufalino setDelegate:self];
    [entre23Bufalino setDelegate:self];
    [mayor3Bufalino setDelegate:self];
    
    [primeraVez setDelegate:self];
    [nacimiento setDelegate:self];
    [compra setDelegate:self];
    [perdidaDIN setDelegate:self];
    
    
    
    //Boton avanzar con metodo accion avanzar
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(avanzar:)];
    //titulo
    self.navigationItem.title = @"Identificar";
    // Do any additional setup after loading the view.
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
    
    int resultado =[[appDelegate.tramiteDiccionario objectForKey:@"menor1Bovinos"] integerValue]+
    [entre12Bovinos.text integerValue]+
    [entre23Bovinos.text integerValue]+
    [mayores3Bovinos.text integerValue]+
    [menor1Bufalino.text integerValue]+
    [entre12Bufalino.text integerValue]+
    [entre23Bufalino.text integerValue]+
    [mayor3Bufalino.text integerValue];
    
    if ( resultado> 0) {
   
    //------------------------------------------------------------
    //--------------validar campos nulos --------------------
    //------------------------------------------------------------
    if ([menor1Bovinos.text isEqualToString:@""] || [entre12Bovinos.text isEqualToString:@""] ||[entre23Bovinos.text isEqualToString:@""]||[mayores3Bovinos.text isEqualToString:@""]||[menor1Bufalino.text isEqualToString:@""] || [entre12Bufalino.text isEqualToString:@""] ||[entre23Bufalino.text isEqualToString:@""]||[mayor3Bufalino.text isEqualToString:@""]||[primeraVez.text isEqualToString:@""] || [nacimiento.text isEqualToString:@""] ||[compra.text isEqualToString:@""]||[perdidaDIN.text isEqualToString:@""]) {
        
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Alerta Campos Vacios" message:@"Existen campos Vacios. \n Complete todos los campos para continuar con su tramite" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [message show];
    }else {
        
        //------------------------------------------------------------
        //--------------Agregmos datos al vector--------------------
        //------------------------------------------------------------
        [appDelegate.tramiteDiccionario setObject:menor1Bovinos.text forKey:@"menor1Bovinos"];
        [appDelegate.tramiteDiccionario setObject:entre12Bovinos.text forKey:@"entre12Bovinos"];
        [appDelegate.tramiteDiccionario setObject:entre23Bovinos.text forKey:@"entre23Bovinos"];
        [appDelegate.tramiteDiccionario setObject:mayores3Bovinos.text forKey:@"mayores3Bovinos"];
        [appDelegate.tramiteDiccionario setObject:menor1Bufalino.text forKey:@"menor1Bufalino"];
        [appDelegate.tramiteDiccionario setObject:entre12Bufalino.text forKey:@"entre12Bufalino"];
        [appDelegate.tramiteDiccionario setObject:entre23Bufalino.text forKey:@"entre23Bufalino"];
        [appDelegate.tramiteDiccionario setObject:mayor3Bufalino.text forKey:@"mayor3Bufalino"];
        [appDelegate.tramiteDiccionario setObject:primeraVez.text forKey:@"primeraVez"];
        [appDelegate.tramiteDiccionario setObject:nacimiento.text forKey:@"nacimiento"];
        [appDelegate.tramiteDiccionario setObject:compra.text forKey:@"compra"];
        [appDelegate.tramiteDiccionario setObject:perdidaDIN.text forKey:@"perdidaDIN"];
        
        NSLog(@"diccionario %@", appDelegate.tramiteDiccionario);
        
        JHOEnviarIpadViewController  *cadaConvocatoria = [self.storyboard instantiateViewControllerWithIdentifier:@"Enviar"];
        [self.navigationController pushViewController:cadaConvocatoria animated:YES];

    
    }
    }else {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Alerta 0 a Identificar" message:@"Para poder enviar el tramite almenos debe identificar 1 animal" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [message show];
    }

    
}

//---------------------------------------------------------------------------
//------------- CAMPOS DE RESTRICCION DE CARACTERES   ---------------------
//---------------------------------------------------------------------------


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if((textField == menor1Bovinos && [[textField text] length] - range.length + string.length <= 3) || (textField == entre12Bovinos && [[textField text] length] - range.length + string.length <= 3) || (textField == entre23Bovinos&& [[textField text] length] - range.length + string.length <= 3)|| (textField == mayores3Bovinos&& [[textField text] length] - range.length + string.length <= 3) || (textField == menor1Bufalino && [[textField text] length] - range.length + string.length <= 3) || (textField == entre12Bufalino && [[textField text] length] - range.length + string.length <= 3) || (textField == entre23Bufalino&& [[textField text] length] - range.length + string.length <= 3)|| (textField == mayor3Bufalino&& [[textField text] length] - range.length + string.length <= 3)|| (textField == primeraVez && [[textField text] length] - range.length + string.length <= 3) || (textField == nacimiento && [[textField text] length] - range.length + string.length <= 3) || (textField == compra&& [[textField text] length] - range.length + string.length <= 3)|| (textField == perdidaDIN&& [[textField text] length] - range.length + string.length <= 3) )
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
