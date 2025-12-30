(define (domain meeting-scheduling-temporal)
    (:requirements :strips :typing :fluents :durative-actions :timing :negative-preconditions)
    (:types 
        location 
        person 
    )

    (:predicates
        (at ?l - location)
        (available ?p - person ?l - location) 
        (met ?p - person)
    )

    (:functions
        (total-time) ; Time elapsed since 9:00 AM (T=0)
        (joshua-start-time) ; 540 (6:00 PM)
        (joshua-end-time)   ; 750 (9:30 PM)
        (travel-duration)   ; 7 min
        (min-meet-duration) ; 75 min
    )

    ; 1. Wait action: Allows arbitrary waiting time (used to bridge time gaps)
    (:durative-action wait
        :parameters (?l - location)
        :duration (?d)
        :condition (at start (at ?l))
        :effect (at end (increase (total-time) ?d))
    )

    ; 2. Travel action: Fixed duration transit
    (:durative-action travel
        :parameters (?l_from - location ?l_to - location)
        :duration (= ?duration (travel-duration))
        :condition (at start (at ?l_from))
        :effect (and
            (at start (not (at ?l_from)))
            (at end (at ?l_to))
            (at end (increase (total-time) (travel-duration)))
        )
    )

    ; 3. Joshua Meeting action
    (:durative-action meet_joshua
        :parameters (?l - location ?p - person)
        :duration (?d)
        :condition (and
            (at start (at ?l))
            (at start (available ?p ?l))
            (at start (not (met ?p)))
            
            ; C1: Duration requirement (Min 75 minutes)
            (at start (>= ?d (min-meet-duration)))
            
            ; C2: Start Constraint: Must start AT or AFTER 6:00 PM (T=540)
            (at start (>= (total-time) (joshua-start-time)))

            ; C3: End Constraint: T_s + ?d <= 750. 
            ; Ensure duration ?d is less than or equal to remaining time in the window.
            (at start (<= ?d (- (joshua-end-time) (total-time)))) 
        )
        :effect (and
            (at end (met ?p))
            (at end (increase (total-time) ?d))
        )
    )
)