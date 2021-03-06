; Configurat; Configuration file for Duet WiFi / Ethernet
; executed by the firmware on start-up

; General preferences
M111 S0 						; Debugging off
G21 							; Work in millimetres
G90 							; Send absolute coordinates...
M83 							; ...but relative extruder moves
M555 P2 						; Set firmware compatibility to look like Marlin

; Network
M550 P"e3dtc" 										; Set machine name
M552 S1							; Enable Networking
M586 P0 S1 						; Enable HTTP
M586 P1 S0 						; Disable FTP
M586 P2 S0 						; Disable Telnet

; Printer Type
M667 S1							; Select CoreXY mode    (fw: 2.02)

; Drive direction
M569 P0.0 S0                    ; Drive 0 X
M569 P0.1 S0                    ; Drive 1 Y
M569 P0.2 S1                    ; Drive 2 Z
M569 P0.3 S0                    ; Drive 3 C
M569 P0.4 S1                    ; Drive 4 E0
M569 P0.5 S1                    ; Drive 5 E1
M569 P1.0 S1                    ; Drive 6 E2
M569 P1.1 S1                    ; Drive 7 E3
M569 P1.1 S0                    ; Drive 8 UNUSED


; Stepper motor settings
M584 X0.0 Y0.1 Z0.2 C0.3 E0.4:0.5:1.0:1.1                       ; Apply custom drive mapping
M208 X-30:328.5 Y-46:243 Z0:300 C0:500 S0                       ; Set axis maxima & minima
M350 E16:16:16:16 C8 I1                                         ; Configure microstepping without interpolation (change steps to Hermera)
M350 C8 I0                                                      ; Configure microstepping for tool lock mechanism
M350 X16 Y16 Z16 I1
M92 X100 Y100 Z1600 C100 E384:384:384:384                       ; Set steps per mm (changed to 409 for Hemera)
M566 X600 Y600 Z8 C2 E8000:8000:8000:8000                       ; Set maximum instantaneous speed changes [Lord Miauzer: Changed from 600->200]
M203 X14400 Y14400 Z1200 C5000 E20000:20000:20000:20000         ; Slowed X/Y to 240mm/s
M201 X3000 Y3000 Z400 C500 E6000:6000:6000:6000                 ; Slowed acceleration
M906 X1000 Y1000 Z1330 C400 E900:900:900:900 I30                ; Set motor currents (mA) and motor idle factor in percent - quieter
M84 S120                                                        ; Set idle timeout

; Endstops
M574 X1 P"0.io1.in" S1
M574 Y1 P"0.io2.in" S1
M574 Z0 					; No endstop [RR3] using G30 homing

; Z probe
M558 P8 C"0.io0.in" H3 F360 I0 T20000 		; Set Z probe type to switch, the axes for which it is used and the dive height + speeds
G31 P200 X0 Y0 Z0	 						; Set Z probe trigger value, offset and trigger height
M557 X10:290 Y20:180 S40 					; Define mesh grid

; Coupler
M574 C1 S3 									; Stall detect coupler at low end of its range

;Stall Detection
M915 C S5 F0 H200 R4700						; Coupler
M915 X Y S5 F0 H400 R4700					; X / Y Axes

; Heaters
M308 S0 P"0.temp0" Y"thermistor" T100000 B4138 C0 		; Set thermistor 
M950 H0 C"0.out0" T0							        ; Bed heater
M143 H0 S225 											; Set temperature limit for heater 0 to 225C
M140 H0													; Map the heater to the bed

M308 S1 P"0.temp1" Y"thermistor" A"T0" T100000 B4725 C7.06e-8         ; Set thermistor
M950 H1 C"0.out1" T1                                                  ; Extruder 0 heater
M143 H1 S300                                                          ; Set temperature limit for heater 1 to 300C

M308 S2 P"0.temp2" Y"thermistor" A"T1" T100000 B4725 C7.06e-8         ; Set thermistor
M950 H2 C"0.out2" T2                                                  ; Extruder 1 heater
M143 H2 S300                                                          ; Set temperature limit for heater 2 to 300C

M308 S3 P"1.temp0" Y"thermistor" A"T2" T100000 B4725 C7.06e-8         ; Set thermistor
M950 H3 C"1.out0" T3					                              ; Extruder 2 heater
M143 H3 S300                                                          ; Set temperature limit for heater 3 to 300C

M308 S4 P"1.temp1" Y"thermistor" A"T0" T100000 B4725 C7.06e-8         ; Set thermistor
M950 H4 C"1.out1" T4					                              ; Extruder 0 heater
M143 H4 S300                                                          ; Set temperature limit for heater 4 to 300C

; Tools
M563 P0 S"T0" D0 H1 F2           ; Define tool 0
G10 P0 X0 Y0 Z0 		         ; Reset tool 0 axis offsets
G10 P0 R0 S0 			         ; Reset initial tool 0 active and standby temperatures to 0C

M563 P1 S"T1" D1 H2 F4           ; Define tool 1
G10 P1 X0 Y0 Z0                  ; Reset tool 1 axis offsets
G10 P1 R0 S0                     ; Reset initial tool 1 active and standby temperatures to 0C

M563 P2 S"T2" D2 H3 F6           ; Define tool 2
G10 P2 X0 Y0 Z0                  ; Reset tool 2 axis offsets
G10 P2 R0 S0                     ; Reset initial tool 2 active and standby temperatures to 0C

M563 P3 S"T3" D3 H4 F8           ; Define tool 3
G10 P3 X0 Y0 Z0                  ; Reset tool 3 axis offsets
G10 P3 R0 S0 	

; Fans

M950 F1 C"0.out7"
M950 F2 C"0.out4"
M950 F3 C"0.out8"
M950 F4 C"0.out5"
M950 F5 C"1.out6"
M950 F6 C"1.out3"
M950 F7 C"1.out7"
M950 F8 C"1.out4"						

M106 P1 S255 H1 T70            ; T0 HE
M106 P2 S0                     ; T0 PCF
M106 P3 S255 H2 T70            ; T1 HE
M106 P4 S0                     ; T1 PCF 
M106 P5 S255 H3 T70            ; T2 HE 
M106 P6 S0                     ; T2 PCF
M106 P7 S255 H4 T70            ; T3 HE
M106 P8 S0                     ; T3 PCF

; MISC settings 
M593 F50						; cancel ringing at 50Hz (https://forum.e3d-online.com/threads/accelerometer-and-resonance-measurements-of-the-motion-system.3445/)
;M376 H15						; bed compensation taper

; tool offsets - after usb microscope adjusment
; mental note
; X offsets - subtract
; Y offsets - subtract
; Z offsets - subtract
G10 P0 X21.5 Y44.5 Z-6.20				; T0
G10 P1 X21.8 Y43.32 Z-6
G10 P2 X21.99 Y43.53 Z-5.6
G10 P3 X20.934 Y43.47 Z-6.45

;deselect tools
T-1

M572 D0 S0.01 						; pressure advance T0
M572 D1 S0.01						; pressure advance T1
M572 D2 S0.01						; pressure advance T2
M572 D3 S0.01						; pressure advance T3

; Lights
M98 P"/macros/led_standBy"