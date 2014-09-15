//
//  JHOInformacionPropietaSolicitanIpadViewController.m
//  ProcesAgro
//
//  Created by JHONATAN ACELAS AREVALO on 13/09/14.
//  Copyright (c) 2014 jhonatan. All rights reserved.
//

#import "JHOInformacionPropietaSolicitanIpadViewController.h"
#import "JHOAppDelegate.h"
#import "JHOIdentificarIpadViewController.h"

@interface JHOInformacionPropietaSolicitanIpadViewController (){
    JHOAppDelegate *appDelegate ;
}

@end

@implementation JHOInformacionPropietaSolicitanIpadViewController

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
    //Crea un nuevo objeto tramite diccionario
    appDelegate = (JHOAppDelegate *) [[UIApplication sharedApplication]delegate];
    appDelegate.tramiteDiccionario = [[NSMutableDictionary alloc]init];
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

- (IBAction)continuarIdentificar:(id)sender {
    
    
    //------------------------------------------------------------
    //--------------validar campos nulos --------------------
    //------------------------------------------------------------
    if ([ica3101.text isEqualToString:@""] || [nombreFinca.text isEqualToString:@""] ||[nombrePropietario.text isEqualToString:@""]||[cedulaPropietario.text isEqualToString:@""]||[fijoPropietario.text isEqualToString:@""]||[celularPropietario.text isEqualToString:@""]||[municipio.text isEqualToString:@""]||[departamento.text isEqualToString:@""]||[nombreSolicitante.text isEqualToString:@""] || [cedulaSolicitante.text isEqualToString:@""] ||[fijoSolicitante.text isEqualToString:@""]||[celularSolicitante.text isEqualToString:@""]) {
        
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
        [appDelegate.tramiteDiccionario setObject:municipio.text forKey:@"municipio"];
        [appDelegate.tramiteDiccionario setObject:departamento.text forKey:@"departamento"];
        [appDelegate.tramiteDiccionario setObject:nombreSolicitante.text forKey:@"nombreSolicitante"];
        [appDelegate.tramiteDiccionario setObject:cedulaSolicitante.text forKey:@"cedulaSolicitante"];
        [appDelegate.tramiteDiccionario setObject:fijoSolicitante.text forKey:@"fijoSolicitante"];
        [appDelegate.tramiteDiccionario setObject:celularSolicitante.text forKey:@"celularSolicitante"];
            
        NSLog(@"diccionario %@", appDelegate.tramiteDiccionario);
      
    
        //------------------------------------------------------
        //-------------lanzar siguiente vista---------------------
        //------------------------------------------------------
        JHOIdentificarIpadViewController  *cadaConvocatoria = [self.storyboard instantiateViewControllerWithIdentifier:@"IdentificarIpad"];
        [self.navigationController pushViewController:cadaConvocatoria animated:YES];
        
    }
    
}
@end
