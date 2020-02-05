; tfree3.g
; called when tool 3 is freed

; Drop the bed for the move
G91
G1 Z2 F15000 
G90

;mesh levelling off
G29 S2

;Purge nozzle
M98 P"purge.g"

;Move In
G53 G1 X305.0 Y100 F15000
G53 G1 X305.0 Y200 F15000
G53 G1 X305.0 Y220 F10000
G53 G1 X305.0 Y227 F5000

;Open Coupler
M98 P"/macros/Coupler - Unlock"
M98 P"/macros/led_standBy"

;fan off
M106 P8 S0

;Move Out
G53 G1 X305.0 Y100 F15000
;G53 G1 X150 Y10 F15000
