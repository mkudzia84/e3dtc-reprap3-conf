; homex.g
; called to home the X axis

G91                      ; use relative positioning

G1 H2 X0.5 Y-0.5 F10000  ; energise motors to ensure they are not stalled

G1 H2 Z3 F5000           ; lift Z 3mm
G1 H1 X-400 F1800        ; move left 400mm, stopping at the endstop
G1 H1 X2 F2000           ; move away from end
G1 H1 X-400 F360         ; move left again
G1 H2 Z-3 F1200          ; lower Z
G90                      ; back to absolute positioning
