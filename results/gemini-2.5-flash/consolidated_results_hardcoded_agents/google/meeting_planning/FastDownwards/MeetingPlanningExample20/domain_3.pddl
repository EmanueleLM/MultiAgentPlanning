(define (domain meeting_scheduler)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        location
        person
        time_state ; T0 (0 min), T8 (8 min arrival), T150_Start (150 min available)
        duration_state ; D0 through D75 for tracking meeting minutes
    )
    (:constants 
        CHINATOWN NOBHILL - location
        T0 T8 T150_Start - time_state
        D0 D1 D2 D3 D4 D5 D6 D7 D8 D9 D10 D11 D12 D13 D14 D15 D16 D17 D18 D19 D20
        D21 D22 D23 D24 D25 D26 D27 D28 D29 D30 D31 D32 D33 D34 D35 D36 D37 D38 D39 D40
        D41 D42 D43 D44 D45 D46 D47 D48 D49 D50 D51 D52 D53 D54 D55 D56 D57 D58 D59 D60
        D61 D62 D63 D64 D65 D66 D67 D68 D69 D70 D71 D72 D73 D74 D75 - duration_state
    )

    (:predicates
        (at ?p - person ?l - location)
        (joseph-available) 
        (meeting-active)
        (goal-met)
        (current-time-state ?t - time_state)
        (current-duration ?d - duration_state)
    )

    (:functions
        (total-cost)
    )

    ; --- Travel CT to NH: 8 minutes (T0 -> T8) ---
    (:action travel-ct-to-nh
        :parameters ()
        :precondition (and 
            (at me CHINATOWN)
            (current-time-state T0)
        )
        :effect (and
            (not (at me CHINATOWN))
            (at me NOBHILL)
            (not (current-time-state T0))
            (current-time-state T8)
            (increase (total-cost) 8)
        )
    )

    ; --- Wait for Joseph (T8 -> T150_Start). Duration: 142 minutes ---
    (:action wait-for-joseph
        :parameters ()
        :precondition (and
            (at me NOBHILL)
            (current-time-state T8)
        )
        :effect (and
            (not (current-time-state T8))
            (current-time-state T150_Start)
            (joseph-available)
            (increase (total-cost) 142) 
        )
    )

    ; --- Start Meeting ---
    (:action start-meeting
        :parameters ()
        :precondition (and
            (at me NOBHILL)
            (joseph-available)
            (current-time-state T150_Start)
            (current-duration D0)
            (not (meeting-active))
        )
        :effect (and
            (meeting-active)
        )
    )

    ;; --- Meeting segment definitions (D0 to D74), 1 minute duration each ---
    (:action meet-segment-from-D0-to-D1 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D0)) :effect (and (not (current-duration D0)) (current-duration D1) (increase (total-cost) 1)))
    (:action meet-segment-from-D1-to-D2 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D1)) :effect (and (not (current-duration D1)) (current-duration D2) (increase (total-cost) 1)))
    (:action meet-segment-from-D2-to-D3 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D2)) :effect (and (not (current-duration D2)) (current-duration D3) (increase (total-cost) 1)))
    (:action meet-segment-from-D3-to-D4 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D3)) :effect (and (not (current-duration D3)) (current-duration D4) (increase (total-cost) 1)))
    (:action meet-segment-from-D4-to-D5 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D4)) :effect (and (not (current-duration D4)) (current-duration D5) (increase (total-cost) 1)))
    (:action meet-segment-from-D5-to-D6 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D5)) :effect (and (not (current-duration D5)) (current-duration D6) (increase (total-cost) 1)))
    (:action meet-segment-from-D6-to-D7 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D6)) :effect (and (not (current-duration D6)) (current-duration D7) (increase (total-cost) 1)))
    (:action meet-segment-from-D7-to-D8 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D7)) :effect (and (not (current-duration D7)) (current-duration D8) (increase (total-cost) 1)))
    (:action meet-segment-from-D8-to-D9 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D8)) :effect (and (not (current-duration D8)) (current-duration D9) (increase (total-cost) 1)))
    (:action meet-segment-from-D9-to-D10 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D9)) :effect (and (not (current-duration D9)) (current-duration D10) (increase (total-cost) 1)))
    (:action meet-segment-from-D10-to-D11 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D10)) :effect (and (not (current-duration D10)) (current-duration D11) (increase (total-cost) 1)))
    (:action meet-segment-from-D11-to-D12 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D11)) :effect (and (not (current-duration D11)) (current-duration D12) (increase (total-cost) 1)))
    (:action meet-segment-from-D12-to-D13 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D12)) :effect (and (not (current-duration D12)) (current-duration D13) (increase (total-cost) 1)))
    (:action meet-segment-from-D13-to-D14 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D13)) :effect (and (not (current-duration D13)) (current-duration D14) (increase (total-cost) 1)))
    (:action meet-segment-from-D14-to-D15 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D14)) :effect (and (not (current-duration D14)) (current-duration D15) (increase (total-cost) 1)))
    (:action meet-segment-from-D15-to-D16 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D15)) :effect (and (not (current-duration D15)) (current-duration D16) (increase (total-cost) 1)))
    (:action meet-segment-from-D16-to-D17 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D16)) :effect (and (not (current-duration D16)) (current-duration D17) (increase (total-cost) 1)))
    (:action meet-segment-from-D17-to-D18 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D17)) :effect (and (not (current-duration D17)) (current-duration D18) (increase (total-cost) 1)))
    (:action meet-segment-from-D18-to-D19 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D18)) :effect (and (not (current-duration D18)) (current-duration D19) (increase (total-cost) 1)))
    (:action meet-segment-from-D19-to-D20 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D19)) :effect (and (not (current-duration D19)) (current-duration D20) (increase (total-cost) 1)))
    (:action meet-segment-from-D20-to-D21 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D20)) :effect (and (not (current-duration D20)) (current-duration D21) (increase (total-cost) 1)))
    (:action meet-segment-from-D21-to-D22 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D21)) :effect (and (not (current-duration D21)) (current-duration D22) (increase (total-cost) 1)))
    (:action meet-segment-from-D22-to-D23 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D22)) :effect (and (not (current-duration D22)) (current-duration D23) (increase (total-cost) 1)))
    (:action meet-segment-from-D23-to-D24 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D23)) :effect (and (not (current-duration D23)) (current-duration D24) (increase (total-cost) 1)))
    (:action meet-segment-from-D24-to-D25 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D24)) :effect (and (not (current-duration D24)) (current-duration D25) (increase (total-cost) 1)))
    (:action meet-segment-from-D25-to-D26 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D25)) :effect (and (not (current-duration D25)) (current-duration D26) (increase (total-cost) 1)))
    (:action meet-segment-from-D26-to-D27 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D26)) :effect (and (not (current-duration D26)) (current-duration D27) (increase (total-cost) 1)))
    (:action meet-segment-from-D27-to-D28 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D27)) :effect (and (not (current-duration D27)) (current-duration D28) (increase (total-cost) 1)))
    (:action meet-segment-from-D28-to-D29 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D28)) :effect (and (not (current-duration D28)) (current-duration D29) (increase (total-cost) 1)))
    (:action meet-segment-from-D29-to-D30 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D29)) :effect (and (not (current-duration D29)) (current-duration D30) (increase (total-cost) 1)))
    (:action meet-segment-from-D30-to-D31 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D30)) :effect (and (not (current-duration D30)) (current-duration D31) (increase (total-cost) 1)))
    (:action meet-segment-from-D31-to-D32 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D31)) :effect (and (not (current-duration D31)) (current-duration D32) (increase (total-cost) 1)))
    (:action meet-segment-from-D32-to-D33 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D32)) :effect (and (not (current-duration D32)) (current-duration D33) (increase (total-cost) 1)))
    (:action meet-segment-from-D33-to-D34 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D33)) :effect (and (not (current-duration D33)) (current-duration D34) (increase (total-cost) 1)))
    (:action meet-segment-from-D34-to-D35 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D34)) :effect (and (not (current-duration D34)) (current-duration D35) (increase (total-cost) 1)))
    (:action meet-segment-from-D35-to-D36 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D35)) :effect (and (not (current-duration D35)) (current-duration D36) (increase (total-cost) 1)))
    (:action meet-segment-from-D36-to-D37 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D36)) :effect (and (not (current-duration D36)) (current-duration D37) (increase (total-cost) 1)))
    (:action meet-segment-from-D37-to-D38 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D37)) :effect (and (not (current-duration D37)) (current-duration D38) (increase (total-cost) 1)))
    (:action meet-segment-from-D38-to-D39 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D38)) :effect (and (not (current-duration D38)) (current-duration D39) (increase (total-cost) 1)))
    (:action meet-segment-from-D39-to-D40 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D39)) :effect (and (not (current-duration D39)) (current-duration D40) (increase (total-cost) 1)))
    (:action meet-segment-from-D40-to-D41 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D40)) :effect (and (not (current-duration D40)) (current-duration D41) (increase (total-cost) 1)))
    (:action meet-segment-from-D41-to-D42 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D41)) :effect (and (not (current-duration D41)) (current-duration D42) (increase (total-cost) 1)))
    (:action meet-segment-from-D42-to-D43 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D42)) :effect (and (not (current-duration D42)) (current-duration D43) (increase (total-cost) 1)))
    (:action meet-segment-from-D43-to-D44 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D43)) :effect (and (not (current-duration D43)) (current-duration D44) (increase (total-cost) 1)))
    (:action meet-segment-from-D44-to-D45 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D44)) :effect (and (not (current-duration D44)) (current-duration D45) (increase (total-cost) 1)))
    (:action meet-segment-from-D45-to-D46 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D45)) :effect (and (not (current-duration D45)) (current-duration D46) (increase (total-cost) 1)))
    (:action meet-segment-from-D46-to-D47 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D46)) :effect (and (not (current-duration D46)) (current-duration D47) (increase (total-cost) 1)))
    (:action meet-segment-from-D47-to-D48 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D47)) :effect (and (not (current-duration D47)) (current-duration D48) (increase (total-cost) 1)))
    (:action meet-segment-from-D48-to-D49 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D48)) :effect (and (not (current-duration D48)) (current-duration D49) (increase (total-cost) 1)))
    (:action meet-segment-from-D49-to-D50 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D49)) :effect (and (not (current-duration D49)) (current-duration D50) (increase (total-cost) 1)))
    (:action meet-segment-from-D50-to-D51 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D50)) :effect (and (not (current-duration D50)) (current-duration D51) (increase (total-cost) 1)))
    (:action meet-segment-from-D51-to-D52 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D51)) :effect (and (not (current-duration D51)) (current-duration D52) (increase (total-cost) 1)))
    (:action meet-segment-from-D52-to-D53 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D52)) :effect (and (not (current-duration D52)) (current-duration D53) (increase (total-cost) 1)))
    (:action meet-segment-from-D53-to-D54 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D53)) :effect (and (not (current-duration D53)) (current-duration D54) (increase (total-cost) 1)))
    (:action meet-segment-from-D54-to-D55 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D54)) :effect (and (not (current-duration D54)) (current-duration D55) (increase (total-cost) 1)))
    (:action meet-segment-from-D55-to-D56 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D55)) :effect (and (not (current-duration D55)) (current-duration D56) (increase (total-cost) 1)))
    (:action meet-segment-from-D56-to-D57 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D56)) :effect (and (not (current-duration D56)) (current-duration D57) (increase (total-cost) 1)))
    (:action meet-segment-from-D57-to-D58 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D57)) :effect (and (not (current-duration D57)) (current-duration D58) (increase (total-cost) 1)))
    (:action meet-segment-from-D58-to-D59 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D58)) :effect (and (not (current-duration D58)) (current-duration D59) (increase (total-cost) 1)))
    (:action meet-segment-from-D59-to-D60 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D59)) :effect (and (not (current-duration D59)) (current-duration D60) (increase (total-cost) 1)))
    (:action meet-segment-from-D60-to-D61 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D60)) :effect (and (not (current-duration D60)) (current-duration D61) (increase (total-cost) 1)))
    (:action meet-segment-from-D61-to-D62 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D61)) :effect (and (not (current-duration D61)) (current-duration D62) (increase (total-cost) 1)))
    (:action meet-segment-from-D62-to-D63 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D62)) :effect (and (not (current-duration D62)) (current-duration D63) (increase (total-cost) 1)))
    (:action meet-segment-from-D63-to-D64 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D63)) :effect (and (not (current-duration D63)) (current-duration D64) (increase (total-cost) 1)))
    (:action meet-segment-from-D64-to-D65 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D64)) :effect (and (not (current-duration D64)) (current-duration D65) (increase (total-cost) 1)))
    (:action meet-segment-from-D65-to-D66 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D65)) :effect (and (not (current-duration D65)) (current-duration D66) (increase (total-cost) 1)))
    (:action meet-segment-from-D66-to-D67 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D66)) :effect (and (not (current-duration D66)) (current-duration D67) (increase (total-cost) 1)))
    (:action meet-segment-from-D67-to-D68 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D67)) :effect (and (not (current-duration D67)) (current-duration D68) (increase (total-cost) 1)))
    (:action meet-segment-from-D68-to-D69 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D68)) :effect (and (not (current-duration D68)) (current-duration D69) (increase (total-cost) 1)))
    (:action meet-segment-from-D69-to-D70 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D69)) :effect (and (not (current-duration D69)) (current-duration D70) (increase (total-cost) 1)))
    (:action meet-segment-from-D70-to-D71 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D70)) :effect (and (not (current-duration D70)) (current-duration D71) (increase (total-cost) 1)))
    (:action meet-segment-from-D71-to-D72 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D71)) :effect (and (not (current-duration D71)) (current-duration D72) (increase (total-cost) 1)))
    (:action meet-segment-from-D72-to-D73 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D72)) :effect (and (not (current-duration D72)) (current-duration D73) (increase (total-cost) 1)))
    (:action meet-segment-from-D73-to-D74 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D73)) :effect (and (not (current-duration D73)) (current-duration D74) (increase (total-cost) 1)))
    (:action meet-segment-from-D74-to-D75 :parameters () :precondition (and (meeting-active) (at me NOBHILL) (current-duration D74)) :effect (and (not (current-duration D74)) (current-duration D75) (increase (total-cost) 1)))

    ; --- End Meeting ---
    (:action end-meeting
        :parameters ()
        :precondition (and
            (meeting-active)
            (current-duration D75) 
        )
        :effect (and
            (not (meeting-active))
            (goal-met) 
        )
    )
    
    ; Travel NH to CT: 6 minutes (Included for completeness)
    (:action travel-nh-to-ct
        :parameters ()
        :precondition (and 
            (at me NOBHILL)
            (not (meeting-active))
        )
        :effect (and
            (not (at me NOBHILL))
            (at me CHINATOWN)
            (increase (total-cost) 6)
        )
    )
)