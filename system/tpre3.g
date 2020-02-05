; tpre3.g
; called before tool 3 is selected

;WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING!
;if you are using non-standard length hotends ensure the bed is lowered enough BEFORE undocking the tool!
G91
G1 Z2 F15000
G90

;Ensure no tool is selected
;T-1

;Unlock Coupler
M98 P"/macros/Coupler - Unlock"

;Move to location
G1 X305 Y150 F25000

;Move in
G1 X305 Y180 F25000

;Collect
G1 X305 Y227 F2500

;Close Coupler
M98 P"/macros/Coupler - Lock"
M98 P"/macros/led_T3"

;Move Out
G1 X305 Y100 F4000

