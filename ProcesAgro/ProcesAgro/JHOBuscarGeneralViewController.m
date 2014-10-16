//
//  JHOBuscarGeneralViewController.m
//  ProcesAgro
//
//  Created by JHONATAN ACELAS AREVALO on 7/08/14.
//  Copyright (c) 2014 jhonatan. All rights reserved.
//

#import "JHOBuscarGeneralViewController.h"
#import "JHOAppDelegate.h"
#import <sqlite3.h>
#import "JHOCadaConvocatoriaViewController.h"
#import "JHOOfertaViewController.h"
#import "JHOServiciosViewController.h"
@interface JHOBuscarGeneralViewController (){
     NSMutableArray *vectorConvocatorias;
    NSMutableArray *busquedaSel;
}
@end

@implementation JHOBuscarGeneralViewController

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
    
 
    // un vector lleno y el otro se llena con el filtro de busqueda
    vectorConvocatorias = [[NSMutableArray alloc]init];
    busquedaSel = [[NSMutableArray alloc]init ];
    // Cargamos las convocatorias el vector full
    [self cargarConvocatorias];
    // igualamos el vector lleno al de piltro para que al inicio muestre todo
    for (int i=0; i<[vectorConvocatorias count]; i++) {
        [busquedaSel addObject: [vectorConvocatorias objectAtIndex:i]];
    }
    // recargamos la tabal
    [self.tableView reloadData];

    //-----------------------------------------------
    //         valores de la busqueda
    //-----------------------------------------------
    JHOAppDelegate *appDelegate = (JHOAppDelegate *) [[UIApplication sharedApplication]delegate];
    //appDelegate.buscarFiltro
    NSLog(@" Prueba ----%@",appDelegate.buscarFiltro);
    if (appDelegate.buscarFiltro!=NULL) {
        [_searchBar setText:appDelegate.buscarFiltro];
        NSString *a =appDelegate.buscarFiltro;
        
        
        [busquedaSel removeAllObjects];
        // NSLog(@" selec %@",busquedaSel);
        //NSLog(@"comple %@",vectorConvocatorias);
        for (int i=0; i<[vectorConvocatorias count]; i++) {
            NSDictionary *dic = [vectorConvocatorias objectAtIndex:i];
            NSString *buscar = [dic objectForKey:@"nombre"];
            NSLog(@"buscar %@",buscar);
            NSRange nameRange = [buscar rangeOfString:a  options:NSCaseInsensitiveSearch];
            
            if (nameRange.location != NSNotFound) {
                NSLog(@"agrego %@",[vectorConvocatorias objectAtIndex:i]);
                [busquedaSel addObject:[vectorConvocatorias objectAtIndex:i]];
            }
        }
    }
    
    [self.tableView reloadData];
    
    

      // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//------------------------------------------------------------------
//        esconde el teclado en el momento de hacer scrooll
//------------------------------------------------------------------
-(void) scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.searchBar  resignFirstResponder];
}
//------------------------------------------------------------------
//--------Cargar Convocatorias,servicios y tramite de la DB --------
//------------------------------------------------------------------
- (void) cargarConvocatorias{
    // creamos un objeto del delegado para acceder a las variables
    JHOAppDelegate *appDelegate = (JHOAppDelegate *) [[UIApplication sharedApplication]delegate];
    //bariable db
    sqlite3 *dataBase;
    //variable de sentencia
    sqlite3_stmt *sentencia;
    //abrir la base de datos
    
    // Titulo
    
    NSMutableDictionary *dicSelectConsultas= [[NSMutableDictionary alloc] init];

    [dicSelectConsultas  setValue:@"            CONVOCATORIAS" forKey:@"nombre"];
    [dicSelectConsultas setValue:@"" forKey:@"descripcion"];
    [dicSelectConsultas setValue:@""  forKey:@"descripcion_corta"];
    [dicSelectConsultas setValue:@"" forKey:@"link"];
    [dicSelectConsultas setValue:@"titulo" forKey:@"tipo"];
    [vectorConvocatorias addObject:dicSelectConsultas];
    
    
    if (sqlite3_open([appDelegate.dataBasePath UTF8String], &dataBase)== SQLITE_OK) {
        // crea la sentencia sql de ingresar los datos a la db
        NSString *sql= [NSString stringWithFormat:@"select * from convocatorias"];
        //se crea la sentencia
        NSLog(@"%@",sql);
        if (sqlite3_prepare_v2(dataBase, [sql UTF8String], -1, &sentencia, NULL)== SQLITE_OK) {
            NSLog(@"inserto una oferta");
            while  (sqlite3_step(sentencia)==SQLITE_ROW) {
                NSMutableDictionary *dicSelectConsultas= [[NSMutableDictionary alloc] init];
                NSString *nombreConsulta = [NSString  stringWithUTF8String:( char *)sqlite3_column_text(sentencia, 1)];
                NSString *desCortaConvoc = [NSString  stringWithUTF8String:( char *)sqlite3_column_text(sentencia, 2)];
                NSString *descConvoc = [NSString  stringWithUTF8String:( char *)sqlite3_column_text(sentencia, 3)];
                NSString *linkConvoc = [NSString  stringWithUTF8String: (char*) sqlite3_column_text(sentencia, 4)];
                [dicSelectConsultas  setValue:nombreConsulta forKey:@"nombre"];
                [dicSelectConsultas setValue:descConvoc forKey:@"descripcion"];
                [dicSelectConsultas setValue:desCortaConvoc forKey:@"descripcion_corta"];
                [dicSelectConsultas setValue:linkConvoc forKey:@"link"];
                [dicSelectConsultas setValue:@"convocatoria" forKey:@"tipo"];
                [vectorConvocatorias addObject:dicSelectConsultas];
            }
        }else {
            NSLog(@"Falla en la creacion del sql: listar convocatorias de la DB ");
        }
        // incrementa el contador del vector
        sqlite3_finalize(sentencia);
        // crea la sentencia sql de ingresar los datos a la db
        NSString *sql2= [NSString stringWithFormat:@"select * from servicios"];
        //se crea la sentencia
        NSLog(@"%@",sql2);
        
        NSMutableDictionary *dicSelectConsultas2= [[NSMutableDictionary alloc] init];
        [dicSelectConsultas2  setValue:@"            SERVICIOS" forKey:@"nombre"];
        [dicSelectConsultas2 setValue:@" " forKey:@"descripcion"];
        [dicSelectConsultas2 setValue:@" "  forKey:@"descripcion_corta"];
        [dicSelectConsultas2 setValue:@" " forKey:@"link"];
        [dicSelectConsultas2 setValue:@"titulo" forKey:@"tipo"];
        [vectorConvocatorias addObject:dicSelectConsultas2];
        if (sqlite3_prepare_v2(dataBase, [sql2 UTF8String], -1, &sentencia, NULL)== SQLITE_OK) {
            NSLog(@"Listo Servicio");
            while  (sqlite3_step(sentencia)==SQLITE_ROW) {
                NSMutableDictionary *dicSelectConsultas= [[NSMutableDictionary alloc] init];
                NSString *nombreConsulta = [NSString  stringWithUTF8String:( char *)sqlite3_column_text(sentencia, 1)];
                NSString *descConvoc = [NSString  stringWithUTF8String:( char *)sqlite3_column_text(sentencia, 2)];
                NSString *urldb= [NSString stringWithUTF8String:(char *) sqlite3_column_text(sentencia, 4)];
                [dicSelectConsultas  setValue:nombreConsulta forKey:@"nombre"];
                [dicSelectConsultas setValue:descConvoc forKey:@"descripcion"];
                [dicSelectConsultas setValue:@"servicio" forKey:@"tipo"];
                [dicSelectConsultas setValue:urldb forKey:@"url"];
                [vectorConvocatorias addObject:dicSelectConsultas];
            }
        }else {
            NSLog(@"Falla en la creacion del sql: listar convocatorias de la DB ");
        }
        // incrementa el contador del vector
        sqlite3_finalize(sentencia);
        // crea la sentencia sql de ingresar los datos a la db
        NSString *sql3= [NSString stringWithFormat:@"select * from ofertas_institucionales"];
        //se crea la sentencia
        NSLog(@"%@",sql3);
        NSMutableDictionary *dicSelectConsultas1= [[NSMutableDictionary alloc] init];
        [dicSelectConsultas1  setValue:@"            OFERTAS" forKey:@"nombre"];
        [dicSelectConsultas1 setValue:@" " forKey:@"descripcion"];
        [dicSelectConsultas1 setValue:@"  "  forKey:@"descripcion_corta"];
        [dicSelectConsultas1 setValue:@" " forKey:@"link"];
        [dicSelectConsultas1 setValue:@"titulo" forKey:@"tipo"];
        [vectorConvocatorias addObject:dicSelectConsultas1];
        if (sqlite3_prepare_v2(dataBase, [sql3 UTF8String], -1, &sentencia, NULL)== SQLITE_OK) {
            NSLog(@"Listo una oferta");
            while  (sqlite3_step(sentencia)==SQLITE_ROW) {
                NSMutableDictionary *dicSelectConsultas= [[NSMutableDictionary alloc] init];
                NSString *id_papaoferta = [NSString  stringWithUTF8String:( char *)sqlite3_column_text(sentencia, 0)];
                NSString *nombreConsulta = [NSString  stringWithUTF8String:( char *)sqlite3_column_text(sentencia, 1)];
                NSString *descConvoc = [NSString  stringWithUTF8String:( char *)sqlite3_column_text(sentencia, 2)];
                [dicSelectConsultas  setValue:nombreConsulta forKey:@"nombre"];
                [dicSelectConsultas setValue:descConvoc forKey:@"descripcion"];
                [dicSelectConsultas setValue:id_papaoferta forKeyPath:@"id_papaoferta"];
                [dicSelectConsultas setValue:@"oferta" forKey:@"tipo"];
                [vectorConvocatorias addObject:dicSelectConsultas];
            
            }
        }else {
            NSLog(@"Falla en la creacion del sql: listar convocatorias de la DB ");
        }
        // incrementa el contador del vector
        sqlite3_finalize(sentencia);
        
        
    }else {
        NSLog(@"No se puede abrir la DB para ofertas ");
    }
    sqlite3_close(dataBase);
}
//------------------------------------------------------------------
//-----------------Numero de secciones en la table -----------------
//------------------------------------------------------------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
//------------------------------------------------------------------
//-----------------Numero de celdas    en la table -----------------
//------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [busquedaSel count];
}
//---------------------------------------------------------------------------------
// Metodo que busca si en los datos de entrada del vector busqueda esta la palabra
//             digitada la agrega al vector que lee y muestra
//---------------------------------------------------------------------------------
-(void) searchBar:(UISearchBar*) searchBar textDidChange:(NSString *)text{
    [busquedaSel removeAllObjects];
   // NSLog(@" selec %@",busquedaSel);
    //NSLog(@"comple %@",vectorConvocatorias);
    for (int i=0; i<[vectorConvocatorias count]; i++) {
        NSDictionary *dic = [vectorConvocatorias objectAtIndex:i];
        NSString *buscar = [dic objectForKey:@"nombre"];
        NSLog(@"buscar %@",buscar);
        NSRange nameRange = [buscar rangeOfString:text options:NSCaseInsensitiveSearch];
        
        if (nameRange.location != NSNotFound) {
            NSLog(@"agrego %@",[vectorConvocatorias objectAtIndex:i]);
            [busquedaSel addObject:[vectorConvocatorias objectAtIndex:i]];
        }
    }
    [self.tableView reloadData];
}
//------------------------------------------------------------------
//-----------------Crea cada celda y le asigna un contenido --------
//------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Celidentifield=@"Cell";
    // extraemos la posicion del arreglo segun la posicion del numero de la celda
    NSDictionary *dic = [busquedaSel objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Celidentifield];
    
    if (cell==nil) {
        //  cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Celidentifield];
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Celidentifield];
        
    }
    NSLog(@" tipo cargada %@",[dic objectForKey:@"tipo"]);
    cell.textLabel.text = [dic objectForKey:@"nombre"];
    cell.detailTextLabel.text = [dic objectForKey:@"descripcion"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    // Configure the cell...
    
    return cell;
}
//------------------------------------------------------------------
//-----------------Numero de pixeles de las celdas -----------------
//------------------------------------------------------------------
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
//------------------------------------------------------------------
//-----------------Evento al hacer click en cada celda--------------
//------------------------------------------------------------------
-(void) tableView: (UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *datosBusqueda =[busquedaSel objectAtIndex:indexPath.row];
    
    if ([[datosBusqueda objectForKey:@"tipo" ]isEqual:@"convocatoria"]) {
        JHOCadaConvocatoriaViewController  *cadaConvocatoria = [self.storyboard instantiateViewControllerWithIdentifier:@"JHOCadaConvocatoriaViewController"];
        [self.navigationController pushViewController:cadaConvocatoria animated:YES];
        cadaConvocatoria.textTituloConvocatoria =[datosBusqueda objectForKey:@"nombre"];
        cadaConvocatoria.textDeescripcionConvocatoria = [datosBusqueda objectForKey:@"descripcion"];
        cadaConvocatoria.textLinkConvocatoria = [datosBusqueda objectForKey:@"link"];
        
    }else if ([[datosBusqueda objectForKey:@"tipo" ]isEqual:@"servicio"]){
        
        JHOServiciosViewController  *cadaConvocatoria = [self.storyboard instantiateViewControllerWithIdentifier:@"UrlServicios"];
        [self.navigationController pushViewController:cadaConvocatoria animated:YES];
        cadaConvocatoria.urlCargar=[datosBusqueda objectForKey:@"url"];

       /*
        //------------------------------------------------------------------
        // -------Crea la vista de servicio clase independinte----------
        //------------------------------------------------------------------------
        UIStoryboard *story= [UIApplication sharedApplication].delegate.window.rootViewController.storyboard;
        JHOurlServicesViewController *serv =[story instantiateViewControllerWithIdentifier:@"servicios"];
        serv.modalTransitionStyle= UIModalTransitionStyleCrossDissolve;
        [self presentViewController:serv animated:YES completion:nil];
        // Asignar la url al
        NSLog(@"%@",[datosBusqueda objectForKey:@"url"] )   ;
        NSURL *url = [NSURL URLWithString:[datosBusqueda objectForKey:@"url"]];
        NSURLRequest *loadUrl = [[NSURLRequest alloc]initWithURL:url];
        [serv.urlServicioWeb loadRequest:loadUrl];
        */
    
    }else if ([[datosBusqueda objectForKey:@"tipo" ]isEqual:@"oferta"]){
        // Crea la vista de servicio
        
        JHOOfertaViewController  *cadaConvocatoria = [self.storyboard instantiateViewControllerWithIdentifier:@"ofertaInstitucional"];
        [self.navigationController pushViewController:cadaConvocatoria animated:YES];
        cadaConvocatoria.textTituloOferta = [datosBusqueda objectForKey:@"nombre"];
        cadaConvocatoria.textDeescripcionOferta = [datosBusqueda objectForKey:@"descripcion"];
        cadaConvocatoria.idOferta=[datosBusqueda objectForKey:@"id_papaoferta"];
        NSLog(@" id %@",[datosBusqueda objectForKey:@"id_papaoferta"]);
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
@end
