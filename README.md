# catapult_wearable_tidy_script

## Usage: Rscript catapult_wearable.R [options]

## help page:

-f, \--filename The name of the input file with path.

-v, \--variable The variable that you want the output file contains

-o, \--output The output path that you want the data at

-h, \--help Print this help message and exit.

variables that can be used:

Acceleration.forward, Acceleration.side, Acceleration.up,

Rotation.roll, Rotation.pitch, Rotation.yaw,

RawPlayerLoad, RawPlayerLoad2D, RawPlayerLoad1DFwd,

RawPlayerLoad1DSide, RawPlayerLoad1DUp,

SmoothedPlayerLoad,

imuRotation.roll, imuRotation.pitch, imuRotation.yaw,

imuAcceleration.forward, imuAcceleration.side, imuAcceleration.up,

imuOrientation.forward, imuOrientation.side, imuOrientation.up
