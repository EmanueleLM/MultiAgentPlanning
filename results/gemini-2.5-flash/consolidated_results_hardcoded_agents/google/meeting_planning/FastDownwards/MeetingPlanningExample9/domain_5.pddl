(define (domain meeting-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    
    (:types
        location
    )

    (:predicates
        (at ?l - location)
        (arrived-at-nob-hill) 
        (mary-available)      ; Set when T >= 720 (12:00 PM)
        (meeting-done)        ; Minimum 75 minutes completed
    )
    
    ; Action 1: Travel Union Square to Nob Hill (9 minutes)
    ; Time elapsed: 9. Absolute time: 540 + 9 = 549.
    (:action travel-us-nh
        :parameters ()
        :precondition (and
            (at union-square)
        )
        :effect (and
            (not (at union-square))
            (at nob-hill)
            (arrived-at-nob-hill)
            (increase (total-cost) 9)
        )
    )
    
    ; Action 2: Wait until Mary is available (171 minutes required: 720 - 549)
    ; Time elapsed: 9 + 171 = 180. Absolute time: 720.
    (:action wait-for-availability
        :parameters ()
        :precondition (and
            (at nob-hill)
            (arrived-at-nob-hill)
            (not (mary-available))
        )
        :effect (and
            (mary-available)
            (increase (total-cost) 171)
        )
    )

    ; Action 3: Meet Mary (Minimal duration of 75 minutes)
    ; Time elapsed: 180 + 75 = 255. Absolute time: 795. (Constraint: 795 <= 975 is satisfied).
    (:action meet-mary-min
        :parameters ()
        :precondition (and
            (at nob-hill)
            (mary-available)
            (not (meeting-done))
        )
        :effect (and
            (meeting-done)
            (increase (total-cost) 75)
        )
    )
    
    ; Action 4: Travel Nob Hill to Union Square (7 minutes) - Optional
    ; Time elapsed: 255 + 7 = 262. Absolute time: 802.
    (:action travel-nh-us
        :parameters ()
        :precondition (and
            (at nob-hill)
            (meeting-done) 
        )
        :effect (and
            (not (at nob-hill))
            (at union-square)
            (increase (total-cost) 7)
        )
    )
)