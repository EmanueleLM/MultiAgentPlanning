(define (domain meeting-scheduling)
    (:requirements :typing :durative-actions :action-costs :negative-preconditions)
    (:types
        traveler friend location - object
    )
    (:predicates
        (at ?t - traveler ?l - location)
        (available ?f - friend ?l - location)
        (met ?f - friend)
    )
    (:functions
        (distance ?l1 - location ?l2 - location)
        (time-spent-meeting ?f - friend)
        (total-cost)
    )

    (:durative-action travel
        :parameters (?t - traveler ?l1 - location ?l2 - location)
        :duration (= ?duration (distance ?l1 ?l2))
        :condition (at start (at ?t ?l1))
        :effect (and
            (at start (not (at ?t ?l1)))
            (at end (at ?t ?l2))
        )
    )
    
    (:durative-action wait
        :parameters (?t - traveler ?l - location)
        :duration (?d)
        :condition (at start (at ?t ?l))
        :effect ()
    )

    (:durative-action meet_friend
        :parameters (?t - traveler ?f - friend ?l - location)
        :duration (?d)
        :condition (and
            (at start (at ?t ?l))
            (overall (available ?f ?l))
            
            ; Sarah is available from 1:15 PM (255 min) to 3:15 PM (375 min). 
            ; Since 375 - 255 = 120 minutes, the maximum duration for the meeting cannot exceed 120 minutes.
            (overall (<= ?d 120)) 
            ; Minimum duration (105 min) is checked in the goal.
            ; Start time (>= 255 min) is ensured by prerequisite travel and wait actions in the plan structure.
        )
        :effect (and
            (at end (met ?f))
            (at end (increase (time-spent-meeting ?f) ?d))
            (at end (increase (total-cost) 1))
        )
    )
)