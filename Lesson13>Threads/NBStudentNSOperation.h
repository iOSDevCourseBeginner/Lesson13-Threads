//
//  NBStudentNSOperation.h
//  Lesson13>Threads
//
//  Created by Nick Bibikov on 9/11/14.
//  Copyright (c) 2014 NickBibikov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NBStudentNSOperation : NSObject

@property (strong, nonatomic) NSString* name;

- (void) guessAnswer:(NSInteger) number
                 end:(NSInteger)end
            andBlock:(void(^)(NSString*, NSInteger, CGFloat)) block;

@end
