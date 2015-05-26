//
//  DetailViewController.h
//  core_data
//
//  Created by Мариам Б. on 24.05.15.
//  Copyright (c) 2015 Мариам Б. All rights reserved.
//

#import "ViewController.h"

@interface DetailViewController : UIViewController <UITextFieldDelegate>
@property (nonatomic,assign) BOOL isNew;
@property (nonatomic,strong) NSString * valueName;
@property (nonatomic,strong) NSString * valueAge;
@property (nonatomic,strong) NSString * valueNumber;
@property (weak, nonatomic) IBOutlet UIImageView *imageView_Detail;

@end
