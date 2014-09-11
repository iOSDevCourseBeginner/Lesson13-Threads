//
//  NBStudent.h
//  Lesson13>Threads
//
//  Created by Nick Bibikov on 9/4/14.
//  Copyright (c) 2014 NickBibikov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NBStudent : NSObject

@property (strong, nonatomic) NSString* name;

+ (dispatch_queue_t) queueMethod;

- (void) guessAnswer:(NSInteger) number
                 end:(NSInteger)end
            andBlock:(void(^)(NSString*, NSInteger, CGFloat)) block;

@end
