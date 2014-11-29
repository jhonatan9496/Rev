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

@synthesize departamentos,municipios,vectorDepartamentos,vectorMunicipios,vectorTmpMuni,vectorTmpDeptos,selDep,selMun;

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
    
    selDep = @"seleccionar";
    selMun = @"seleccionar";
    
    
    [ica3101 setDelegate:self];
    [nombreFinca setDelegate:self];
    [nombrePropietario setDelegate:self];
    [cedulaPropietario setDelegate:self];
    [fijoPropietario setDelegate:self];
    [celularPropietario setDelegate:self];
    [nombreSolicitante setDelegate:self];
    [cedulaSolicitante setDelegate:self];
    [fijoSolicitante setDelegate:self];
    [celularSolicitante setDelegate:self];
    [nombreVereda setDelegate:self];
    
    
    //Crea un nuevo objeto tramite diccionario
    appDelegate = (JHOAppDelegate *) [[UIApplication sharedApplication]delegate];
    appDelegate.tramiteDiccionario = [[NSMutableDictionary alloc]init];
    // Do any additional setup after loading the view.
    
    
    // --------------------------------
    //  picker
    // --------------------------------
    
    
    // --------------------------------
    //  lleno deptos
    // --------------------------------
    NSURL * url = [NSURL URLWithString:@"http://154.70.153.108/proyectos/procesAgroWeb/web/app.php/departamentos"];
    NSData * jsonData = [NSData dataWithContentsOfURL:url
                                              options:NSUTF8StringEncoding
                                                error:nil];
    NSError * error;
    NSMutableArray * arreglo= [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    self.vectorTmpDeptos=arreglo;
    NSLog(@"%@",arreglo);
    
    //arreglo temporal
    NSMutableArray *d = [[NSMutableArray alloc]initWithObjects:@"Seleccione Departamento", nil];
    
    // lleno arreglo temporal con lo que necesito de json
    for (int i=0; i<[arreglo count]; i++) {
        NSObject *tmp =[arreglo[i] objectForKey:@"nombreDepartamento"];
        [d addObject:tmp];
    }
    
    // asigno al pick view el vector
    self.vectorDepartamentos =d;
    
    
    // --------------------------------
    //  lleno inicial muni
    // --------------------------------
    
    NSMutableArray *m = [[NSMutableArray alloc]initWithObjects:@"Seleccione Departamento", nil];
    self.vectorMunicipios =m;
    
    
    
    // --------------------------------
    //  temporal muni
    // --------------------------------
    
    NSURL * url2 = [NSURL URLWithString:@"http://154.70.153.108/proyectos/procesAgroWeb/web/app.php/municipios/"];
    NSData * jsonData2 = [NSData dataWithContentsOfURL:url2
                                               options:NSUTF8StringEncoding
                                                 error:nil];
    NSError * error2;
    NSArray * arreglo2= [NSJSONSerialization JSONObjectWithData:jsonData2 options:kNilOptions error:&error2];
    //NSLog(@"arreglo normal %@",arreglo2);
    
    //arreglo temporal
    NSMutableArray *t = [[NSMutableArray alloc]init];
    
    // lleno arreglo temporal con lo que necesito de json
    for (int i=0; i<[arreglo2 count]; i++) {
        NSMutableDictionary *tmp = [[NSMutableDictionary alloc]init];
        [tmp setValue:[arreglo2[i] objectForKey:@"nombreMunicipio"] forKey:@"municipio"];
        [tmp setValue:[arreglo2[i] objectForKey:@"departamento"] forKey:@"idDepto"];
        
        
        
        [t addObject:tmp];
    }
    
    self.vectorTmpMuni = t;
    
    NSLog(@" vector temporal munis %@",vectorTmpMuni);
    NSLog(@" vector temporal deptos %@",vectorTmpDeptos);

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



// ------------------
// metodos pick
// ------------------
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (pickerView == departamentos) {
        return [vectorDepartamentos count];
    }
    return [vectorMunicipios count];
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView == departamentos) {
        
        return [self.vectorDepartamentos objectAtIndex:row];
    }else if (pickerView == municipios){
        return [self.vectorMunicipios objectAtIndex:row];
    }
    return [self.vectorMunicipios objectAtIndex:row];
    
}


- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    //int selet = row;
    //NSLog(@"%i",selet);
    
    
    // [departamentos reloadAllComponents];
    
    if (pickerView == departamentos) {
        
        if (row != 0 ) {
            
            
            
            NSLog(@" %@", [vectorTmpDeptos[row-1] objectForKey:@"id"]);
            
            selDep =[vectorTmpDeptos[row-1] objectForKey:@"nombreDepartamento"];
            
            
            [self.vectorMunicipios removeAllObjects];
            
            NSMutableArray *m = [[NSMutableArray alloc]initWithObjects:@"Seleccione Municipio" , nil];
            
            for (int i = 0; i<[vectorTmpMuni count]; i++) {
                
                
                // NSLog(@"com1 %i ",[[vectorTmpMuni[i] objectForKey:@"idDepto"] integerValue]);
                // NSLog(@"com2 %i ",[[vectorTmpDeptos[row-1] objectForKey:@"id"] integerValue]);
                
                
                if ([[vectorTmpMuni[i] objectForKey:@"idDepto"] integerValue]== [[vectorTmpDeptos[row-1] objectForKey:@"id"] integerValue] ) {
                    
                    NSObject *tmp =[vectorTmpMuni[i] objectForKey:@"municipio"];
                    [m addObject:tmp];
                    
                }
            }
            
            
            
            self.vectorMunicipios =m;
            selMun = @"seleccionar";
            [municipios reloadAllComponents];
            
        }
        else{
            selDep = @"seleccionar";
            selMun = @"seleccionar";
            [self.vectorMunicipios removeAllObjects];
            NSMutableArray *m = [[NSMutableArray alloc]initWithObjects:@"Seleccione Departamento", nil];
            self.vectorMunicipios =m;
            [municipios reloadAllComponents];
        }
    }
    
    
    
    if (pickerView == municipios) {
        
        if (row != 0 ) {
            NSLog(@" %@",vectorMunicipios[row]  );
            selMun = vectorMunicipios[row] ;
        }else {
            selMun = @"seleccionar";
        }
    }
    
    
}


- (IBAction)continuarIdentificar:(id)sender {
    
    
    //------------------------------------------------------------
    //--------------validar campos nulos --------------------
    //------------------------------------------------------------
    if ([ica3101.text isEqualToString:@""] || [nombreFinca.text isEqualToString:@""] ||[nombrePropietario.text isEqualToString:@""]||[cedulaPropietario.text isEqualToString:@""]||[fijoPropietario.text isEqualToString:@""]||[celularPropietario.text isEqualToString:@""]||[nombreSolicitante.text isEqualToString:@""] || [cedulaSolicitante.text isEqualToString:@""] ||[fijoSolicitante.text isEqualToString:@""]||[celularSolicitante.text isEqualToString:@""] ||[selDep isEqualToString:@"seleccionar"]||[selMun isEqualToString:@"seleccionar"]|| [nombreVereda.text isEqualToString:@""] ) {
        
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
        [appDelegate.tramiteDiccionario setObject:selMun forKey:@"municipio"];
        [appDelegate.tramiteDiccionario setObject:selDep forKey:@"departamento"];
        [appDelegate.tramiteDiccionario setObject:nombreSolicitante.text forKey:@"nombreSolicitante"];
        [appDelegate.tramiteDiccionario setObject:cedulaSolicitante.text forKey:@"cedulaSolicitante"];
        [appDelegate.tramiteDiccionario setObject:fijoSolicitante.text forKey:@"fijoSolicitante"];
        [appDelegate.tramiteDiccionario setObject:celularSolicitante.text forKey:@"celularSolicitante"];
        [appDelegate.tramiteDiccionario setObject:nombreVereda forKey:@"nombreVereda"];
            
        NSLog(@"diccionario %@", appDelegate.tramiteDiccionario);
      
    
        //------------------------------------------------------
        //-------------lanzar siguiente vista---------------------
        //------------------------------------------------------
        JHOIdentificarIpadViewController  *cadaConvocatoria = [self.storyboard instantiateViewControllerWithIdentifier:@"IdentificarIpad"];
        [self.navigationController pushViewController:cadaConvocatoria animated:YES];
        
    }
    
}

//------------------------------------------------------
//-------------Guardar todos  Teclado---------------------
//------------------------------------------------------

-(BOOL) textFieldShouldReturn: (UITextField *) textField {
    [self resignFirstResponder];
    return YES;
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
    else if((textField == nombreFinca && [[textField text] length] - range.length + string.length <= 50) || (textField == nombrePropietario && [[textField text] length] - range.length + string.length <= 50) ||(textField == nombreSolicitante && [[textField text] length] - range.length + string.length <= 30)||(textField == nombreVereda && [[textField text] length] - range.length + string.length <= 30))
    {
        NSCharacterSet *invalidCharSet = [[NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz "] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:invalidCharSet] componentsJoinedByString:@""];
        return [string isEqualToString:filtered];
    }
    else if((textField == cedulaPropietario && [[textField text] length] - range.length + string.length <= 11) || (textField == fijoPropietario && [[textField text] length] - range.length + string.length <= 11)|| (textField == celularPropietario && [[textField text] length] - range.length + string.length <= 10)||(textField == celularSolicitante && [[textField text] length] - range.length + string.length <= 10) || (textField == fijoSolicitante && [[textField text] length] - range.length + string.length <= 10) || (textField == cedulaSolicitante&& [[textField text] length] - range.length + string.length <= 10))
    {
        NSCharacterSet *invalidCharSet = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:invalidCharSet] componentsJoinedByString:@""];
        return [string isEqualToString:filtered];
    }
    else
        return NO;
    
    
}



@end
