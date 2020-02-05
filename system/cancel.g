; Disable Mesh Compensation.
G29 S2  

; purge tool
;M98 P"purge.g"

; park tool
T-1

; park the head
G1 X35 Y200

; Heaters off
M0

; Lights
M98 P"/macros/led_alert"

