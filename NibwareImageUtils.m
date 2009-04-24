
#import "NibwareImageUtils.h"
#import "NibwareReachability.h"

static CImageQualityDataPoint imageQualityDataPoints[] = {
    {1600,0.05,50687},
    {1600,0.10,52098},
    {1600,0.15,53765},
    {1600,0.20,58930},
    {1600,0.25,66891},
    {1600,0.30,77129},
    {1600,0.35,107615},
    {1600,0.40,125180},
    {1600,0.45,194964},
    {1600,0.50,226582},
    {1600,0.55,249978},
    {1600,0.60,267846},
    {1600,0.65,307648},
    {1600,0.70,333420},
    {1600,0.75,371102},
    {1600,0.80,400291},
    {1600,0.85,420841},
    {1600,0.90,464817},
    {1600,0.95,476880},
    {1600,1.00,1484862},
    {1400,0.05,40251},
    {1400,0.10,41087},
    {1400,0.15,42527},
    {1400,0.20,45885},
    {1400,0.25,52207},
    {1400,0.30,62050},
    {1400,0.35,78454},
    {1400,0.40,98197},
    {1400,0.45,122623},
    {1400,0.50,148529},
    {1400,0.55,178734},
    {1400,0.60,204695},
    {1400,0.65,243086},
    {1400,0.70,268259},
    {1400,0.75,302900},
    {1400,0.80,340798},
    {1400,0.85,375055},
    {1400,0.90,419577},
    {1400,0.95,442843},
    {1400,1.00,1520237},
    {1200,0.05,30951},
    {1200,0.10,31497},
    {1200,0.15,32563},
    {1200,0.20,35054},
    {1200,0.25,39302},
    {1200,0.30,46234},
    {1200,0.35,57608},
    {1200,0.40,71890},
    {1200,0.45,89897},
    {1200,0.50,109239},
    {1200,0.55,132022},
    {1200,0.60,151778},
    {1200,0.65,181107},
    {1200,0.70,200841},
    {1200,0.75,228305},
    {1200,0.80,258821},
    {1200,0.85,285312},
    {1200,0.90,320229},
    {1200,0.95,338386},
    {1200,1.00,1145214},
    {1024,0.05,23535},
    {1024,0.10,23959},
    {1024,0.15,24752},
    {1024,0.20,26441},
    {1024,0.25,29499},
    {1024,0.30,34175},
    {1024,0.35,42242},
    {1024,0.40,52118},
    {1024,0.45,64999},
    {1024,0.50,78837},
    {1024,0.55,95527},
    {1024,0.60,109948},
    {1024,0.65,131418},
    {1024,0.70,145786},
    {1024,0.75,166021},
    {1024,0.80,189338},
    {1024,0.85,209571},
    {1024,0.90,237046},
    {1024,0.95,252341},
    {1024,1.00,879864},
    {800,0.05,15961},
    {800,0.10,16269},
    {800,0.15,16764},
    {800,0.20,17883},
    {800,0.25,19756},
    {800,0.30,22545},
    {800,0.35,26954},
    {800,0.40,32588},
    {800,0.45,39989},
    {800,0.50,48418},
    {800,0.55,58436},
    {800,0.60,67136},
    {800,0.65,80552},
    {800,0.70,89460},
    {800,0.75,102127},
    {800,0.80,117178},
    {800,0.85,130487},
    {800,0.90,149375},
    {800,0.95,160871},
    {800,1.00,530425},
    {640,0.05,11386},
    {640,0.10,11575},
    {640,0.15,11942},
    {640,0.20,12749},
    {640,0.25,14085},
    {640,0.30,15927},
    {640,0.35,18680},
    {640,0.40,22006},
    {640,0.45,26496},
    {640,0.50,31625},
    {640,0.55,37887},
    {640,0.60,43450},
    {640,0.65,52072},
    {640,0.70,57705},
    {640,0.75,65687},
    {640,0.80,75506},
    {640,0.85,84189},
    {640,0.90,96437},
    {640,0.95,104212},
    {640,1.00,391059},
    {320,0.05,4378},
    {320,0.10,4454},
    {320,0.15,4591},
    {320,0.20,4890},
    {320,0.25,5360},
    {320,0.30,6017},
    {320,0.35,6882},
    {320,0.40,7862},
    {320,0.45,9024},
    {320,0.50,10359},
    {320,0.55,11956},
    {320,0.60,13260},
    {320,0.65,15472},
    {320,0.70,16896},
    {320,0.75,18973},
    {320,0.80,21306},
    {320,0.85,23319},
    {320,0.90,26253},
    {320,0.95,27941},
    {320,1.00,113633},
    {240,0.05,3137},
    {240,0.10,3192},
    {240,0.15,3292},
    {240,0.20,3510},
    {240,0.25,3836},
    {240,0.30,4241},
    {240,0.35,4830},
    {240,0.40,5496},
    {240,0.45,6250},
    {240,0.50,7056},
    {240,0.55,8031},
    {240,0.60,8887},
    {240,0.65,10263},
    {240,0.70,11143},
    {240,0.75,12361},
    {240,0.80,13770},
    {240,0.85,14999},
    {240,0.90,16675},
    {240,0.95,17619},
    {240,1.00,66685},
    {160,0.05,2001},
    {160,0.10,2030},
    {160,0.15,2085},
    {160,0.20,2188},
    {160,0.25,2351},
    {160,0.30,2571},
    {160,0.35,2884},
    {160,0.40,3216},
    {160,0.45,3649},
    {160,0.50,4038},
    {160,0.55,4551},
    {160,0.60,4992},
    {160,0.65,5630},
    {160,0.70,6093},
    {160,0.75,6706},
    {160,0.80,7451},
    {160,0.85,7998},
    {160,0.90,8786},
    {160,0.95,9189},
    {160,1.00,29825},
};


@implementation NibwareImageUtils

+ (float) round_to_nearest_quality:(float) quality
{
    quality = fmin(1.0, fmax(quality, 0.05));
    
    return fmax(round(quality/0.05), 1) * 0.05;
}

+ (NSInteger) estimateBytesForImage:(UIImage *)image quality:(float)quality
{
    return [NibwareImageUtils estimateBytes:image.size quality:quality];
}

#define CLOSER(desired, cur, contender) (fabs(contender-desired) <= fabs(cur-desired))

+ (CImageQualityDataPoint) findClosestPointForSize:(int)longEdge quality:(float)quality
{
    int maxI = sizeof(imageQualityDataPoints) / sizeof(CImageQualityDataPoint) - 1;
    
    CImageQualityDataPoint res = {0,0.0,0};
    
    for (int i = 0; i <= maxI; i++)
    {
        CImageQualityDataPoint tmp = imageQualityDataPoints[i];
        if (CLOSER(longEdge, res.longEdgeSize, tmp.longEdgeSize)
            && CLOSER(quality, res.quality, tmp.quality))
        {
            res = tmp;
        }
    }
    
    return res;
}

+ (NSInteger) estimateBytes:(CGSize)size quality:(float)quality
{
    float longEdge = fmax(size.width, size.height);
    CImageQualityDataPoint nearest = [NibwareImageUtils findClosestPointForSize:longEdge quality:quality];
    
    NSLog(@"estimateBytes: nearest for %f x %f @ %.0f is %f / %.0f",
          (float) size.width, (float) size.height, (float) quality*100, (float) nearest.longEdgeSize, (float) nearest.quality*100);
    
    return nearest.size;
}

+ (NSInteger) estimateUploadTime:(NSInteger)bytes
{
    // give it 10 seconds for goo measure
    float seconds = 10;
    int estSpeed;
    NibwareNetworkStatus net = [[NibwareReachability sharedReachability] internetConnectionStatus];
    switch (net) {
        case ReachableViaWiFiNetwork:
            estSpeed = 512000;
            break;
        case ReachableViaCarrierDataNetwork:
        default:
            estSpeed = 60000;
    }
    
    // add some encoding overhead
    seconds += ceil((bytes * 1.8 * 8.0) / estSpeed);

    return seconds;
}

@end
