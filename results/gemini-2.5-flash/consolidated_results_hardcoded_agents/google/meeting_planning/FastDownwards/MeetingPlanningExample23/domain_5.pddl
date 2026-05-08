(define (domain meeting-scheduler-classical)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        location
        friend
    )

    (:predicates
        (at-location ?l - location)
        (john-met) ; True when the meeting duration >= 75 minutes is satisfied

        ; Time state markers (Representing absolute time T reached)
        (time-T540)
        (time-T1027) ; Earliest departure time (1050 - 23)
        (time-T1050) ; Earliest arrival/meeting start time
        (time-T1125) ; Earliest meeting end time (1050 + 75)
    )

    (:constants
        bayview - location
        russian-hill - location
        john - friend
    )

    (:functions
        ; Tracks time passed in minutes since T=540 (9:00 AM)
        (total-cost) 
    )
    
    ; 1. Wait until T=1027 (Duration 487 minutes)
    (:action wait-for-minimum-departure
        :parameters ()
        :precondition (and
            (at-location bayview)
            (time-T540)
        )
        :effect (and
            (not (time-T540))
            (time-T1027)
            ; Time advance: 1027 - 540 = 487 minutes
            (increase (total-cost) 487)
        )
    )
    
    ; 2. Travel to Russian Hill (Fixed Duration 23 minutes)
    (:action travel-to-russianhill
        :parameters ()
        :precondition (and
            (at-location bayview)
            (time-T1027)
        )
        :effect (and
            (not (at-location bayview))
            (at-location russian-hill)
            (not (time-T1027))
            (time-T1050) ; Arrival at 1050
            ; Time advance: 23 minutes
            (increase (total-cost) 23)
        )
    )

    ; 3. Meet John (Minimum 75 minutes)
    (:action meet-john-75min
        :parameters ()
        :precondition (and
            (at-location russian-hill)
            (time-T1050)
            (not (john-met))
        )
        :effect (and
            (john-met)
            (not (time-T1050))
            (time-T1125) 
            ; Time advance: 75 minutes
            (increase (total-cost) 75)
        )
    )
)