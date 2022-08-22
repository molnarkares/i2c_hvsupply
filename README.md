# I2C controlled High voltage power supply for GM tubes

The device implements an I2C controlled variable output power supply (400V-600V), 
a GM tube pulse counter and an optional wake-up timer to trigger the host processor periodically.

The device was designed to keep the power consumption as low as possible. 

## Hardware

The physical hardware is a non-isolated flyback controller with 
voltage multiplier. The output voltage can be controlled by injecting bias current in the feedback loop of the controller IC. The circuit is using a PIC16LF1764 microcontroller.

## Firmware

The firmware is implemented in C using the Free License variant of the 
Microchip XC8 compiler 
See the readme in the firmware folder for details on operation and rebuild.

## Documentation

A comprehensive Users Manual is available in Latex format and converted to PDF in the doc folder.


## License

The project is available under MIT license, see the details in the sub-folders.

