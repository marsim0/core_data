//
//  PersonTableViewCell.h
//  core_data
//
//  Created by Мариам Б. on 24.05.15.
//  Copyright (c) 2015 Мариам Б. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *cellLabel_Name;
@property (weak, nonatomic) IBOutlet UILabel *cellLabel_Age;
@property (weak, nonatomic) IBOutlet UILabel *cellLabel_PhoneNumber;
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;


@end
