; tpre0.g
; called before tool 0 is selected

;Ensure no tool is selected
;T-1


;WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING!
;if you are using non-standard length hotends ensure the bed is lowered enough BEFORE undocking the tool!
G91
G1 Z2 F15000
G90

;Unlock Coupler
M98 P"/macros/Coupler - Unlock"

;Move to location
G1 X-10.5 Y150 F25000

;Move in
G1 X-10.5 Y180 F25000

;Collect
G1 X-10.5 Y227 F2500

;Close Coupler
M98 P"/macros/Coupler - Lock"
M98 P"/macros/led_T0"

;Move Out
G1 X-10.5 Y100 F4000

