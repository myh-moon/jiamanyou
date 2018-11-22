//
//  NoteCell.h
//  jiamanyou
//
//  Created by jiamanu on 2018/8/2.
//  Copyright © 2018年 jiamanyou. All rights reserved.
//

#import "BaseCell.h"
#import "NoteItem.h"

@interface NoteCell : BaseCell

@property (nonatomic,strong) UILabel *noteLabel;

@property (nonatomic,strong,readwrite) NoteItem *item;

@end
