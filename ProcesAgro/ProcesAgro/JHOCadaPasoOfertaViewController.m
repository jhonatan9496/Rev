//
//  JHOCadaPasoOfertaViewController.m
//  ProcesAgro
//
//  Created by JHONATAN ACELAS AREVALO on 29/11/14.
//  Copyright (c) 2014 jhonatan. All rights reserved.
//

#import "JHOCadaPasoOfertaViewController.h"

@interface JHOCadaPasoOfertaViewController ()

@end

@implementation JHOCadaPasoOfertaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_tituloPasoOferta setText:_textTituloPaso];
    [_descripcionPasoOferta setText:_textDeescripcionPaso];
    self.navigationItem.title = @"Pasos Oferta";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
