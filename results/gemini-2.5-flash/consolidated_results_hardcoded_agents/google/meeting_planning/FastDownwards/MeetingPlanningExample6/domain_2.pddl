(define (domain meeting-planning-6)
    (:requirements :strips :typing :negative-preconditions :action-costs :numeric-fluents)
    (:types
        location
    )
    (:predicates
        (at ?l - location)
        (met_kenneth_90min)
        (time_t304) ; 14:04 (304 minutes elapsed): Departure Time from FW
        (time_t315) ; 14:15 (315 minutes elapsed): Arrival/Meeting Start at NH
        (time_t405) ; 15:45 (405 minutes elapsed): Meeting End
    )
    (:functions
        (total-time)
    )

    ; Action 1: Wait at FW until the minimum required departure time (T=304).
    ; This action represents a skip across time while remaining stationary.
    (:action wait_until_departure
        :parameters (?fw - location)
        :precondition (and 
            (at ?fw)
            (not (time_t304))
        )
        :effect (and
            (time_t304)
            (increase (total-time) 304)
        )
    )

    ; Action 2: Travel from Fisherman's Wharf (FW) to Nob Hill (NH)
    ; Duration: 11 minutes. Must depart at T=304 to arrive exactly at T=315.
    (:action travel_fw_nh
        :parameters (?fw - location ?nh - location)
        :precondition (and 
            (at ?fw)
            (time_t304)
            (not (time_t315))
        )
        :effect (and
            (not (at ?fw))
            (at ?nh)
            (time_t315)
            (increase (total-time) 11)
        )
    )

    ; Action 3: Meet Kenneth for 90 minutes minimum at Nob Hill.
    ; Starts at T=315 (2:15 PM), ends at T=405 (3:45 PM).
    (:action meet_kenneth_90min
        :parameters (?nh - location)
        :precondition (and
            (at ?nh)
            (time_t315) 
            (not (met_kenneth_90min))
            (not (time_t405))
        )
        :effect (and
            (met_kenneth_90min)
            (time_t405)
            (increase (total-time) 90)
        )
    )
)