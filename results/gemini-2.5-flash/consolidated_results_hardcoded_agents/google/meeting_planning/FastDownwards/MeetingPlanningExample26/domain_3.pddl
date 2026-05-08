(define (domain MEETING-SCHEDULING)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        TRAVELER FRIEND LOCATION TIME-STAGE - object
    )
    (:predicates
        (at ?t - TRAVELER ?l - LOCATION)
        ; is-ready-to-meet implies the friend is available at that location
        (is-ready-to-meet ?f - FRIEND ?l - LOCATION) 
        (met-for-required-duration ?f - FRIEND)
        ; time-is tracks the conceptual stage based on elapsed time (in minutes from 9:00 AM)
        (time-is ?ts - TIME-STAGE)
    )
    (:functions
        (total-friends-met)
    )

    ; Stage 1: Travel from Richmond to Presidio (7 min duration)
    ; T=0 (9:00 AM) -> T=7 (9:07 AM)
    (:action TRAVEL-R-P
        :parameters (?t - TRAVELER)
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
    
    ; Stage 2: Wait until Sarah is available (1:15 PM, T=255)
    ; T=7 (9:07 AM arrival) -> T=255 (1:15 PM start time). Wait 248 minutes.
    (:action WAIT-FOR-SARAH-AVAILABILITY
        :parameters (?t - TRAVELER ?f - FRIEND)
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

    ; Stage 3: Meet Sarah for 105 minutes (Minimum required duration satisfied)
    ; T=255 (1:15 PM Start) -> T=360 (3:00 PM End). Window closes at T=375 (3:15 PM).
    (:action MEET-SARAH-105-MIN
        :parameters (?t - TRAVELER ?f - FRIEND ?l - LOCATION)
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
            (not (is-ready-to-meet ?f ?l))
        )
    )
)