(define (domain meeting-planning)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types 
        location 
        person
    )

    (:constants
        md ha - location
        margaret - person
    )

    (:predicates 
        (at ?l - location)
        (met ?p - person)
        (meeting ?p - person)
    )

    (:functions
        (current-time)
        (meeting-duration ?p - person)
        (total-cost)
    )

    ;; Travel MD -> HA (12 min)
    (:action travel-md-ha
        :parameters ()
        :precondition (at md)
        :effect (and
            (not (at md))
            (at ha)
            (increase (current-time) 12)
            (increase (total-cost) 1)
        )
    )

    ;; Travel HA -> MD (11 min)
    (:action travel-ha-md
        :parameters ()
        :precondition (at ha)
        :effect (and
            (not (at ha))
            (at md)
            (increase (current-time) 11)
            (increase (total-cost) 1)
        )
    )

    ;; Start Meeting Margaret (Must start between 480 and 915)
    (:action start-meeting-margaret
        :parameters ()
        :precondition (and 
            (at ha) 
            (not (meeting margaret))
            ;; Margaret's availability starts at 480 minutes (8:00 AM)
            (>= (current-time) 480) 
            ;; Must start early enough to guarantee 30 min before 945 (945 - 30 = 915)
            (<= (current-time) 915) 
        )
        :effect (and 
            (meeting margaret)
        )
    )

    ;; Continue Meeting Margaret (1 minute increment)
    (:action continue-meeting-margaret-minute
        :parameters ()
        :precondition (and 
            (meeting margaret)
            ;; Must finish before or exactly at 945
            (< (current-time) 945) 
        )
        :effect (and 
            (increase (current-time) 1)
            (increase (meeting-duration margaret) 1)
        )
    )

    ;; End Meeting Margaret (Minimum duration 30 min met)
    (:action end-meeting-margaret
        :parameters ()
        :precondition (and 
            (meeting margaret)
            (>= (meeting-duration margaret) 30)
        )
        :effect (and 
            (not (meeting margaret))
            (met margaret) 
        )
    )
)