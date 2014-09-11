//
//  NBStudent.m
//  Lesson13>Threads
//
//  Created by Nick Bibikov on 9/4/14.
//  Copyright (c) 2014 NickBibikov. All rights reserved.
//

#import "NBStudent.h"

@interface NBStudent ()

+ (dispatch_queue_t) queueMethod;

@end

@implementation NBStudent

+ (dispatch_queue_t) queueMethod {

    static dispatch_queue_t staticQueue;
    static dispatch_once_t task;
    
    dispatch_once(&task, ^ {
        staticQueue = dispatch_queue_create("com.nbibikov.testthread.taskqueue", DISPATCH_QUEUE_CONCURRENT);
    });
    return staticQueue;
    
}

- (void) guessAnswer:(NSInteger) number
                 end:(NSInteger)end
            andBlock:(void(^)(NSString*, NSInteger, CGFloat)) block {

    dispatch_async ([NBStudent queueMethod], ^{
        
        double startTime = CACurrentMediaTime();
        NSInteger searchAnswer = 0;
        while (searchAnswer != number) {
            searchAnswer = arc4random_uniform(end);
        }
        block(self.name, searchAnswer, CACurrentMediaTime() - startTime);

    });
    
}



@end
