#include <CoreFoundation/CoreFoundation.h>
#include "MachServer.h"
#include "Defines.generated.h"

static MachServer *sMachServer;

extern "C" {
static void init_server() {
    sMachServer =[[MachServer alloc] init];
    }

static void start_server() {
    [sMachServer run];
}

static void sotp_server() {
    [sMachServer stop];
}

static void destroy_server() {
    sMachServer = nil;
}

static void send_frame(double width, double height, uint64_t pts, uint32_t fpsNumerator, uint32_t fpsDenominator, uint8_t * frameBytes) {
    [sMachServer sendFrameWithSize:NSMakeSize(width, height) timestamp:pts fpsNumerator:fpsNumerator fpsDenominator:fpsDenominator frameBytes:frameBytes];
}
}


