module System.DevUtils.Base.Cloud.Amazon.EC2 (
 EC2 (..)
) where

--import DevUtils.Base.Cloud.Usage

data EC2 = EC2 {
 _name :: String,
 _desc :: String,
 _vcpu :: Int,
 _ecu :: Int,
 _memory :: Double,
 _storage :: Int
-- _usage :: [Usage]
}

{-
	vCPU	ECU	Memory (GiB)	Instance Storage (GB)	Linux/UNIX Usage
General Purpose - Current Generation
t2.micro	1	Variable	1	EBS Only	$0.013 per Hour
t2.small	1	Variable	2	EBS Only	$0.026 per Hour
t2.medium	2	Variable	4	EBS Only	$0.052 per Hour
m3.medium	1	3	3.75	1 x 4 SSD	$0.070 per Hour
m3.large	2	6.5	7.5	1 x 32 SSD	$0.140 per Hour
m3.xlarge	4	13	15	2 x 40 SSD	$0.280 per Hour
m3.2xlarge	8	26	30	2 x 80 SSD	$0.560 per Hour
Compute Optimized - Current Generation
c3.large	2	7	3.75	2 x 16 SSD	$0.105 per Hour
c3.xlarge	4	14	7.5	2 x 40 SSD	$0.210 per Hour
c3.2xlarge	8	28	15	2 x 80 SSD	$0.420 per Hour
c3.4xlarge	16	55	30	2 x 160 SSD	$0.840 per Hour
c3.8xlarge	32	108	60	2 x 320 SSD	$1.680 per Hour
GPU Instances - Current Generation
g2.2xlarge	8	26	15	60 SSD	$0.650 per Hour
Memory Optimized - Current Generation
r3.large	2	6.5	15	1 x 32 SSD	$0.175 per Hour
r3.xlarge	4	13	30.5	1 x 80 SSD	$0.350 per Hour
r3.2xlarge	8	26	61	1 x 160 SSD	$0.700 per Hour
r3.4xlarge	16	52	122	1 x 320 SSD	$1.400 per Hour
r3.8xlarge	32	104	244	2 x 320 SSD	$2.800 per Hour
Storage Optimized - Current Generation
i2.xlarge	4	14	30.5	1 x 800 SSD	$0.853 per Hour
i2.2xlarge	8	27	61	2 x 800 SSD	$1.705 per Hour
i2.4xlarge	16	53	122	4 x 800 SSD	$3.410 per Hour
i2.8xlarge	32	104	244	8 x 800 SSD	$6.820 per Hour
hs1.8xlarge	16	35	117	24 x 2048	$4.600 per Hour
-}
