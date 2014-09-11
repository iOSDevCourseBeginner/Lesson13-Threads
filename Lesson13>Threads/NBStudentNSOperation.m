//
//  NBStudentNSOperation.m
//  Lesson13>Threads
//
//  Created by Nick Bibikov on 9/11/14.
//  Copyright (c) 2014 NickBibikov. All rights reserved.
//

#import "NBStudentNSOperation.h"

@interface NBStudentNSOperation ()

+ (NSOperationQueue*) queueMethodOperation;

@end

@implementation NBStudentNSOperation

+ (NSOperationQueue*) queueMethodOperation {
    
    static NSOperationQueue* operationQueue;
    static dispatch_once_t task;
    
    dispatch_once(&task, ^ {
        operationQueue = [[NSOperationQueue alloc] init];
    });
    return operationQueue;
    
}

- (void) guessAnswer:(NSInteger) number
                 end:(NSInteger)end
            andBlock:(void(^)(NSString*, NSInteger, CGFloat)) block {
    
    [[NBStudentNSOperation queueMethodOperation] addOperationWithBlock: ^{
        __weak NBStudentNSOperation* weakSealf = self;
        double startTime = CACurrentMediaTime();
        NSInteger searchAnswer = 0;
        while (searchAnswer != number) {
            searchAnswer = arc4random_uniform(end);
        }
        block(weakSealf.name, searchAnswer, CACurrentMediaTime() - startTime);
        
    }];
    
}


@end
