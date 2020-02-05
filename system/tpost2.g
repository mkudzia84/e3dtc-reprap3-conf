; tpost2.g
; called after tool 2 has been selected

;heatup
M116 P2 S5

;prime nozzle
M120
M98 P"prime.g"
M121

;mesh levelling on
G29 S1

;PCF fan on
M106 R1	
