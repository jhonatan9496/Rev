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
    
    [municipio setDelegate:self];
    [departamento setDelegate:self];
    
    //Boton avanzar con metodo accion avanzar
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(avanzar:)];
    
    
    // --------------------------------
    //  picker
    // --------------------------------
    
    
    // --------------------------------
    //  lleno deptos
    // --------------------------------
    NSURL * url = [NSURL URLWithString:@"http://procesagro.tucompualdia.com/departamentos"];
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
    
    NSURL * url2 = [NSURL URLWithString:@"http://procesagro.tucompualdia.com/municipios/"];
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
  
    
    /*
    //Crear boton info
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    //Asignarle evento al boton info
    [btn addTarget:self action:@selector(avanzar:) forControlEvents:UIControlEventTouchUpInside];
    //Agregar el boton al nav bar
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
     
     */
    
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
    if ([selDep isEqualToString:@"seleccionar"]||[selMun isEqualToString:@"seleccionar"]) {
        
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Alerta Campos Vacios o Demaciado largos" message:@"Existen campos Vacios o Demaciado Largos. \n Complete todos los campos ó verifique  que la informacion sea correcta para continuar con su tramite" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil]; [message show];
    }else {
        //------------------------------------------------------------
        //--------------Agregmos datos al diccionario--------------------
        //------------------------------------------------------------
    [appDelegate.tramiteDiccionario setObject:selMun forKey:@"municipio"];
    [appDelegate.tramiteDiccionario setObject:selDep forKey:@"departamento"];
    
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
