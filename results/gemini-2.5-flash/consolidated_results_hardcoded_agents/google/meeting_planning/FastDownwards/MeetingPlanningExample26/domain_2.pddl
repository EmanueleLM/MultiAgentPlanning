(define (domain meeting-scheduling)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        traveler friend location time-stage - object
    )
    (:predicates
        (at ?t - traveler ?l - location)
        ; is-ready-to-meet implies the friend is available at that location
        (is-ready-to-meet ?f - friend ?l - location) 
        (met-for-required-duration ?f - friend)
        ; time-is tracks the conceptual stage based on elapsed time (in minutes from 9:00 AM)
        (time-is ?ts - time-stage)
    )
    (:functions
        (total-friends-met)
    )

    ; Step 1: Travel from Richmond to Presidio (7 min duration)
    ; T=0 (9:00 AM) -> T=7 (9:07 AM)
    (:action travel_R_P
        :parameters (?t - traveler)
        :precondition (and
            (at ?t Richmond)
            (time-is T0)
        )
        :effect (and
            (not (at ?t Richmond))
            (at ?t Presidio)
            (not (time-is T0))
            (time-is T7)
        )
    )
    
    ; Step 2: Wait until Sarah is available (1:15 PM, T=255)
    ; T=7 -> T=255 (Implicit wait of 248 minutes)
    (:action wait_for_sarah_availability
        :parameters (?t - traveler ?f - friend)
        :precondition (and
            (at ?t Presidio)
            (time-is T7)
        )
        :effect (and
            (not (time-is T7))
            (time-is T255) 
            (is-ready-to-meet ?f Presidio)
        )
    )

    ; Step 3: Meet Sarah for 105 minutes (Minimum required duration satisfied)
    ; T=255 (1:15 PM) -> T=360 (3:00 PM). This duration is within Sarah's availability (ends T=375).
    (:action meet_sarah_105_min
        :parameters (?t - traveler ?f - friend ?l - location)
        :precondition (and
            (at ?t ?l)
            (is-ready-to-meet ?f ?l)
            (time-is T255)
            (not (met-for-required-duration ?f))
        )
        :effect (and
            (met-for-required-duration ?f)
            (not (time-is T255))
            (time-is T360) 
            (increase (total-friends-met) 1)
        )
    )
)