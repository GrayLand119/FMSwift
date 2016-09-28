# FMSwift
Package DFU Service into FMSwift, Can use FMSwift.framework instead of iOSDFULibrary for Nordic Bluetooth Chip.
如果你的项目是OC工程,在使用Pod iOSDFULibrary时需要使用!use_framework,这会导致其与你Pod项目中其他的一些第三方框架产生冲突,使用FMSwift.framework代替Pod iOSDFULibrary可以解决这些问题.

### Device Firmware Update

The **Device Firmware Update (DFU)** profile allows you to update the application, bootloader and/or the Soft Device image over-the-air (OTA). It is compatible with Nordic Semiconductor nRF5x devices that have the S-Series SoftDevice and bootloader enabled. From version 1.5 onward, the nRF Toolbox has allowed to send the required init packet. More information about the init packet may be found here: [init packet handling](https://github.com/NordicSemiconductor/nRF-Master-Control-Panel/tree/master/init%20packet%20handling).

The nRF Toolbox 3.0 is using the DFULibrary framework, available here: [IOS-DFU-Library](https://github.com/NordicSemiconductor/IOS-DFU-Library). The library is required to compile the project. Please, follow the steps in this repository to add it to the project.

The DFU has the following features:
- Scans for devices that are in DFU mode.
- Connects to devices in DFU mode and uploads the selected firmware (Softdevice, Bootloader and/or application).
- Allows HEX or BIN file upload through your phone or tablet.
- Allows to update a Softdevice and/or bootloader and application from ZIP automatically.
- Pause, resume, and cancel file uploads.
- Includes pre-installed examples that consist of the Bluetooth Smart heart rate service and running speed and cadence service.

### Note
- iOS 8.0 and above is required.
- iPhone 4S or newer is required.
- iPad 3 or newer is required.
- Compatible with nRF5x devices with S-Series Softdevice and DFU Bootloader flashed.
