#include <CoreFoundation/CoreFoundation.h>
#include "MachServer.h"
#include "Defines.generated.h"

static MachServer *sMachServer;

extern "C" {
 void init_server() {
    sMachServer =[[MachServer alloc] init];
    }

 void start_server() {
    [sMachServer run];
}

 void stop_server() {
    [sMachServer stop];
}

 void destroy_server() {
    sMachServer = nil;
}

 void send_frame(double width, double height, uint64_t pts, uint32_t fpsNumerator, uint32_t fpsDenominator, uint8_t * frameBytes) {
    [sMachServer sendFrameWithSize:NSMakeSize(width, height) timestamp:pts fpsNumerator:fpsNumerator fpsDenominator:fpsDenominator frameBytes:frameBytes];
}
}


