(define (domain meeting-scheduling)
    (:requirements :strips :typing :negative-preconditions :action-costs) 
    
    (:types
        location
    )
    
    (:predicates
        (at ?l - location)
        (is-marina ?l - location)
        (is-pacific-heights ?l - location)
        (meeting-successful)
        
        ; Time state tracking predicates based on elapsed total-cost:
        (at-pacific-heights-early)             ; T < 1140
        (can-start-meeting-chunk-1)          ; 1140 <= T < 1155
        (can-start-meeting-chunk-2)          ; 1155 <= T < 1170
        (too-late-to-start)                  ; T >= 1170
    )

    (:functions
        (total-meetings-successful)
        (total-cost) 
    )

    ; Travel 1: Marina District to Pacific Heights (7 minutes). T_arrival = 547
    (:action travel_marina_to_pacific_heights
        :parameters (?m - location ?p - location)
        :precondition (and
            (is-marina ?m)
            (is-pacific-heights ?p)
            (at ?m)
        )
        :effect (and
            (not (at ?m))
            (at ?p)
            (at-pacific-heights-early)
            (increase (total-cost) 7)
        )
    )

    ; Travel 2: Pacific Heights to Marina District (6 minutes)
    (:action travel_pacific_heights_to_marina
        :parameters (?p - location ?m - location)
        :precondition (and
            (is-pacific-heights ?p)
            (is-marina ?m)
            (at ?p)
        )
        :effect (and
            (not (at ?p))
            (at ?m)
            (increase (total-cost) 6)
        )
    )
    
    ; Waiting sequence (547 -> 1140 = 593 minutes total wait)
    
    (:action wait_500
        :parameters (?p - location)
        :precondition (and 
            (is-pacific-heights ?p) 
            (at ?p) 
            (at-pacific-heights-early)
        )
        ; Corrected: wrapped single effect in (and)
        :effect (and (increase (total-cost) 500)) 
    )
    
    (:action wait_90
        :parameters (?p - location)
        :precondition (and 
            (is-pacific-heights ?p) 
            (at ?p) 
            (at-pacific-heights-early)
        )
        ; Corrected: wrapped single effect in (and)
        :effect (and (increase (total-cost) 90))
    )
    
    ; Transition wait: 3 minutes to T=1140 (Margaret available)
    (:action wait_3_to_start_window
        :parameters (?p - location)
        :precondition (and 
            (is-pacific-heights ?p) 
            (at ?p) 
            (at-pacific-heights-early)
        )
        :effect (and
            (not (at-pacific-heights-early))
            (can-start-meeting-chunk-1) ; T = 1140
            (increase (total-cost) 3)
        )
    )
    
    ; --- Meeting/Wait Block 1 (1140 -> 1155) ---
    
    ; Option A: Meet Margaret (starts 1140, ends 1155)
    (:action meet_margaret_chunk1
        :parameters (?p - location)
        :precondition (and 
            (is-pacific-heights ?p)
            (at ?p)
            (can-start-meeting-chunk-1) 
            (not (meeting-successful))
        )
        :effect (and 
            (meeting-successful)
            (increase (total-meetings-successful) 1)
            (increase (total-cost) 15)
            (not (can-start-meeting-chunk-1))
        )
    )
    
    ; Option B: Wait 15 minutes (to T=1155)
    (:action wait_15_minutes_chunk1_to_chunk2
        :parameters (?p - location)
        :precondition (and 
            (is-pacific-heights ?p)
            (at ?p)
            (can-start-meeting-chunk-1) 
            (not (meeting-successful))
        )
        :effect (and
            (not (can-start-meeting-chunk-1))
            (can-start-meeting-chunk-2) ; T = 1155
            (increase (total-cost) 15)
        )
    )

    ; --- Meeting/Wait Block 2 (1155 -> 1170) ---
    
    ; Option A: Meet Margaret (starts 1155, ends 1170)
    (:action meet_margaret_chunk2
        :parameters (?p - location)
        :precondition (and 
            (is-pacific-heights ?p)
            (at ?p)
            (can-start-meeting-chunk-2) 
            (not (meeting-successful))
        )
        :effect (and 
            (meeting-successful)
            (increase (total-meetings-successful) 1)
            (increase (total-cost) 15)
            (not (can-start-meeting-chunk-2))
        )
    )

    ; Option B: Wait 15 minutes (to T=1170), missing the window's latest start time
    (:action wait_15_minutes_chunk2_to_too_late
        :parameters (?p - location)
        :precondition (and 
            (is-pacific-heights ?p)
            (at ?p)
            (can-start-meeting-chunk-2) 
            (not (meeting-successful))
        )
        :effect (and
            (not (can-start-meeting-chunk-2))
            (too-late-to-start) ; T = 1170
            (increase (total-cost) 15)
        )
    )
)