(define (domain meeting-planning-strips)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        location
    )

    (:predicates
        (at ?l - location)
        (traveled-to-nobhill)
        (ready-to-meet) ; Indicates absolute time is >= 720 (12:00 PM)
        (meeting-done)  ; Indicates minimum 75 min meeting duration is satisfied
    )
    
    (:functions
        (elapsed-time) ; Tracks time elapsed since 9:00 AM (T=540)
    )

    ; Action 1: Travel Union Square to Nob Hill (9 minutes)
    ; Initial time is 540. Arrival time is 549.
    (:action travel-us-nh
        :parameters ()
        :precondition (and 
            (at Union_Square)
            (not (traveled-to-nobhill))
        )
        :effect (and
            (not (at Union_Square))
            (at Nob_Hill)
            (traveled-to-nobhill)
            (increase (elapsed-time) 9)
        )
    )
    
    ; Action 2: Wait for Mary's availability (171 minutes)
    ; Must wait from arrival (549) until 720 minutes absolute time. 720 - 549 = 171.
    (:action wait-for-mary
        :parameters ()
        :precondition (and
            (at Nob_Hill)
            (traveled-to-nobhill)
            (not (ready-to-meet))
        )
        :effect (and
            (increase (elapsed-time) 171)
            (ready-to-meet)
        )
    )

    ; Action 3: Meet Mary (minimum 75 minutes duration)
    ; Starts at 720. Ends at 795.
    (:action meet-mary
        :parameters ()
        :precondition (and
            (at Nob_Hill)
            (ready-to-meet)
            (not (meeting-done))
        )
        :effect (and
            (increase (elapsed-time) 75)
            (meeting-done)
        )
    )

    ; Action 4: Travel Nob Hill to Union Square (7 minutes) - Optional for goal satisfaction
    (:action travel-nh-us
        :parameters ()
        :precondition (and 
            (at Nob_Hill)
        )
        :effect (and
            (not (at Nob_Hill))
            (at Union_Square)
            (increase (elapsed-time) 7)
        )
    )
)