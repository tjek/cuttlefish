//
//  ColorPaletteTableViewCell.h
//  Cuttlefish
//
//  Created by Laurie Hufford on 02/09/2015.
//  Copyright (c) 2015 ShopGun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorPaletteTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *primaryTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondaryTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *disabledTextLabel;

@property (weak, nonatomic) IBOutlet UIView *shadesView;

@end
