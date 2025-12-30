(define (domain meeting-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types 
        location 
        person
    )

    (:constants
        md ha - location
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
            ;; Start must be after Margaret arrives (480)
            (>= (current-time) 480) 
            ;; Must start early enough to guarantee 30 min before 945 (T <= 915)
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
            ;; Meeting must finish before or exactly at 945. current-time must be < 945
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