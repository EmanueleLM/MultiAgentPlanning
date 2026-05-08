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
        
        ; Time state tracking predicates (Time is measured by total-cost)
        (at-pacific-heights-early)             ; Current Time T < 1140
        (can-start-meeting-chunk-1)            ; 1140 <= T < 1155
        (can-start-meeting-chunk-2)            ; 1155 <= T < 1170
        (too-late-to-start)                    ; T >= 1170
    )

    (:functions
        (total-meetings-successful)
        (total-cost) 
    )

    ; Action 1: Travel Marina District to Pacific Heights (7 minutes)
    ; T_start = 540, T_end = 547
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
            (at-pacific-heights-early) ; T = 547
            (increase (total-cost) 7)
        )
    )

    ; Wait sequence (547 -> 1140 = 593 minutes total wait)
    
    (:action wait_500
        :parameters (?p - location)
        :precondition (and 
            (is-pacific-heights ?p) 
            (at ?p) 
            (at-pacific-heights-early)
        )
        :effect (increase (total-cost) 500) 
    )
    
    (:action wait_90
        :parameters (?p - location)
        :precondition (and 
            (is-pacific-heights ?p) 
            (at ?p) 
            (at-pacific-heights-early)
        )
        :effect (increase (total-cost) 90)
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
    
    ; Meet Margaret (starts 1140, ends 1155). 15 minutes minimum requirement met.
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
    
    ; Wait 15 minutes (T=1140 -> T=1155). Only possible if we haven't met her yet.
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
    
    ; Meet Margaret (starts 1155, ends 1170). Last possible start time.
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

    ; Wait 15 minutes (T=1155 -> T=1170). Leads to failure if goal not met yet.
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
            (too-late-to-start) ; T = 1170. Meeting window closed (1170+15 > 1185)
            (increase (total-cost) 15)
        )
    )
    
    ; Travel 2: Pacific Heights to Marina District (6 minutes)
    ; Requires completion of the meeting time or failure of the window.
    (:action travel_pacific_heights_to_marina
        :parameters (?p - location ?m - location)
        :precondition (and
            (is-pacific-heights ?p)
            (is-marina ?m)
            (at ?p)
            (or (meeting-successful) (too-late-to-start))
        )
        :effect (and
            (not (at ?p))
            (at ?m)
            (increase (total-cost) 6)
        )
    )
)