; tpost3.g
; called after tool 3 has been selected

;heatup
M116 P3 S5

;prime nozzle - soft nozzle, don't
;M120
;M98 P"prime.g"
;M121

;mesh levelling on
G29 S1

;PCF fan on
M106 R1	
