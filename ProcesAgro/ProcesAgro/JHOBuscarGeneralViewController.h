//
//  JHOBuscarGeneralViewController.h
//  ProcesAgro
//
//  Created by JHONATAN ACELAS AREVALO on 7/08/14.
//  Copyright (c) 2014 jhonatan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHOBuscarGeneralViewController : UIViewController <UIScrollViewDelegate>{
    IBOutlet UISearchBar *searchBar;
}

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
