//
//  DFUServiceController.swift
//  Pods
//
//  Created by Mostafa Berg on 20/06/16.
//
//

import CoreBluetooth

public class DFUServiceController : NSObject {

    private let executor:DFUExecutor
    
    private var servicePaused = false
    private var serviceAborted = false
    
    internal init(_ executor:DFUExecutor) {
        self.executor = executor
    }
    
    /**
     Call this method to pause uploading during the transmition process. The transmition can be resumed
     only when connection remains. If service has already started sending firmware data it will pause after receiving
     next Packet Receipt Notification. Otherwise it will continue to send Op Codes and pause before sending the first bytes
     of the firmware. With Packet Receipt Notifications disabled it is the only moment when upload may be paused.
     */
    public func pause() {
        if !servicePaused && executor.pause() {
            servicePaused = true
        }
    }
    
    /**
     Call this method to resume the paused transffer, otherwise does nothing.
     */
    public func resume() {
        if servicePaused && executor.resume() {
            servicePaused = false
        }
    }
    
    /**
     Aborts the upload. The phone will disconnect from peripheral. The peripheral will try to
     recover the last firmware. Might, restart in the Bootloader mode if the application has been
     removed.
     
     Abort (Reset) command will be sent instead of a next Op Code, or after receiving a
     Packet Receipt Notification. It PRM procedure is disabled it will continue until the whole
     firmware is sent and then Reset will be sent instead of Verify Firmware op code.
     */
    public func abort() {
        serviceAborted = true
        executor.abort()
    }
    
    /**
     Starts again aborted DFU operation.
     */
    public func restart() {
        // TODO needs testing
        if serviceAborted {
            serviceAborted = false
            executor.start()
        }
    }
    
    /**
     Returns true if DFU operation has been paused.
     */
    public var paused:Bool {
        return servicePaused
    }
    
    /**
     Returns true if DFU operation has been aborted.
     */
    public var aborted:Bool {
        return serviceAborted
    }
}
