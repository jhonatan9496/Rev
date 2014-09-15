//
//  JHOCeldaPasosOfertaTableViewCell.m
//  ProcesAgro
//
//  Created by JHONATAN ACELAS AREVALO on 10/08/14.
//  Copyright (c) 2014 jhonatan. All rights reserved.
//

#import "JHOCeldaPasosOfertaTableViewCell.h"
#import "JHOAppDelegate.h"
#import <sqlite3.h>


@implementation JHOCeldaPasosOfertaTableViewCell
@synthesize tituloPaso,check,desPaso,id_paso;
 
- (IBAction)cambioSwicth:(id)sender {
    //NSLog(@"cambio %@",tituloPaso.text);
    
    if ([check isOn]) {
        NSLog(@"cambio prendido  %@",id_paso);
        [self cambiarPrendido];
    }else{
        NSLog(@"cambio apagado  %@",id_paso);
        [self cambiarApagado];
    }
}

//------------------------------------------------------------------
//-----------------Actualizar estado paso prendido  -----------------
//------------------------------------------------------------------
- (void) cambiarPrendido{
    // creamos un objeto del delegado para acceder a las variables
    JHOAppDelegate *appDelegate = (JHOAppDelegate *) [[UIApplication sharedApplication]delegate];
    //bariable db
    sqlite3 *dataBase;
    //variable de sentencia
    sqlite3_stmt *sentencia;
    //abrir la base de datos
    if (sqlite3_open([appDelegate.dataBasePath UTF8String], &dataBase)== SQLITE_OK) {
        // crea la sentencia sql de ingresar los datos a la db
        NSString *sql= [NSString stringWithFormat:@"update pasos_ofertas set estado='YES' where id_paso=%@",id_paso];
        //se crea la sentencia
        NSLog(@"%@",sql);
        if (sqlite3_prepare_v2(dataBase, [sql UTF8String], -1, &sentencia, NULL)== SQLITE_OK) {
            NSLog(@"inserto una oferta");
            while  (sqlite3_step(sentencia)==SQLITE_ROW) {
               
            }
        }else {
            NSLog(@"Falla en la creacion del sql: actualizar check ");
        }
        // incrementa el contador del vector
        sqlite3_finalize(sentencia);
    }else {
        NSLog(@"No se puede abrir la DB para ofertas ");
    }
    sqlite3_close(dataBase);
}

- (void) cambiarApagado{
    // creamos un objeto del delegado para acceder a las variables
    JHOAppDelegate *appDelegate = (JHOAppDelegate *) [[UIApplication sharedApplication]delegate];
    //bariable db
    sqlite3 *dataBase;
    //variable de sentencia
    sqlite3_stmt *sentencia;
    //abrir la base de datos
    if (sqlite3_open([appDelegate.dataBasePath UTF8String], &dataBase)== SQLITE_OK) {
        // crea la sentencia sql de ingresar los datos a la db
        NSString *sql= [NSString stringWithFormat:@"update pasos_ofertas set estado='NO' where id_paso=%@",id_paso];
        //se crea la sentencia
        NSLog(@"%@",sql);
        if (sqlite3_prepare_v2(dataBase, [sql UTF8String], -1, &sentencia, NULL)== SQLITE_OK) {
            NSLog(@"inserto una oferta");
            while  (sqlite3_step(sentencia)==SQLITE_ROW) {
                
            }
        }else {
            NSLog(@"Falla en la creacion del sql: actualizar check ");
        }
        // incrementa el contador del vector
        sqlite3_finalize(sentencia);
    }else {
        NSLog(@"No se puede abrir la DB para ofertas ");
    }
    sqlite3_close(dataBase);
}


@end
