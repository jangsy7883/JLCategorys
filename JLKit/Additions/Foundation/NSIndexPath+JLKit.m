//
//  NSIndexPath+JLKit.m
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "NSIndexPath+JLKit.h"
#import <UIKit/UIKit.h>

@implementation NSIndexPath (Additions)

- (BOOL)isEqualToIndexPath:(NSIndexPath*)indexPath {
	if (self == nil || indexPath == nil) {
		return NO;
	}
    
	return (self.row == indexPath.row && self.section == indexPath.section);
}

@end
