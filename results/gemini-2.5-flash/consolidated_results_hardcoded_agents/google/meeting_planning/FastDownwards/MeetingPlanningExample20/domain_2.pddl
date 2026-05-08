(define (domain meeting_scheduler)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        location
        person
    )
    (:predicates
        (at ?p - person ?l - location)
        (is-available ?f - person ?l - location)
        (is-meeting ?p1 - person ?p2 - person)
        (goal-met)
        (at-nobhill)
        (waited-for-joseph)
    )

    (:functions
        (current-time)
        (meeting-duration ?p1 - person ?p2 - person)
        (total-cost)
    )

    ; Travel CT to NH: 8 minutes
    (:action travel-ct-to-nh
        :parameters (?p - person)
        :precondition (and 
            (at ?p CHINATOWN)
        )
        :effect (and
            (not (at ?p CHINATOWN))
            (at ?p NOBHILL)
            (at-nobhill)
            (increase (current-time) 8)
            (increase (total-cost) 8)
        )
    )

    ; Travel NH to CT: 6 minutes (Included for completeness, not required for goal)
    (:action travel-nh-to-ct
        :parameters (?p - person)
        :precondition (at ?p NOBHILL)
        :effect (and
            (not (at ?p NOBHILL))
            (at ?p CHINATOWN)
            (increase (current-time) 6)
            (increase (total-cost) 6)
        )
    )

    ; Wait action: Jump time if arrived before T=150 (Joseph available time).
    (:action wait-for-joseph
        :parameters (?me - person)
        :precondition (and
            (at-nobhill)
            (not (waited-for-joseph))
            (< (current-time) 150) 
        )
        :effect (and
            (waited-for-joseph)
            ; Calculate wait duration = 150 - current-time
            (increase (total-cost) (- 150 (current-time)))
            (assign (current-time) 150)
        )
    )

    ; Start Meeting 
    (:action start-meeting-joseph
        :parameters (?me - person ?joseph - person)
        :precondition (and
            (at ?me NOBHILL)
            (is-available ?joseph NOBHILL)
            (>= (current-time) 150) ; Joseph available start time (11:30 AM)
            (not (is-meeting ?me ?joseph))
            ; Max start time is 300 to ensure 75 minutes meeting completion by 375
            (<= (current-time) 300) 
        )
        :effect (and
            (is-meeting ?me ?joseph)
        )
    )
    
    ; Meeting Segment (1 minute)
    (:action meet-segment
        :parameters (?me - person ?joseph - person)
        :precondition (and
            (is-meeting ?me ?joseph)
            (at ?me NOBHILL)
            (< (meeting-duration ?me ?joseph) 75)
            ; Must finish the segment before Joseph leaves (T=375)
            (< (current-time) 375) 
        )
        :effect (and
            (increase (current-time) 1)
            (increase (meeting-duration ?me ?joseph) 1)
            (increase (total-cost) 1)
        )
    )

    ; End Meeting
    (:action end-meeting-joseph
        :parameters (?me - person ?joseph - person)
        :precondition (and
            (is-meeting ?me ?joseph)
            (>= (meeting-duration ?me ?joseph) 75)
        )
        :effect (and
            (not (is-meeting ?me ?joseph))
            (goal-met) 
        )
    )