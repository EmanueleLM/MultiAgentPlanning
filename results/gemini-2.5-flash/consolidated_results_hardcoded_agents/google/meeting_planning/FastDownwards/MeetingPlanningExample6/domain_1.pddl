(define (domain meeting-planning-6)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        location
    )
    (:predicates
        (at ?l - location)
        (met_kenneth_90min)
        (time_t304) ; 14:04 (304 minutes elapsed): Time to depart FW
        (time_t315) ; 14:15 (315 minutes elapsed): Time of arrival at NH/Meeting start
        (time_t405) ; 15:45 (405 minutes elapsed): Time Meeting ends (315 + 90)
    )
    (:functions
        (total-time)
    )

    ; Action 1: Wait at Fisherman's Wharf until the minimum required departure time (14:04 = T=304 min).
    (:action wait_until_departure
        :parameters ()
        :precondition (and 
            (at fw)
            (not (time_t304))
        )
        :effect (and
            (time_t304)
            (increase (total-time) 304)
        )
    )

    ; Action 2: Travel from Fisherman's Wharf (FW) to Nob Hill (NH)
    ; Duration: 11 minutes. Must depart at T=304 to arrive exactly at Kenneth's opening time (T=315).
    (:action travel_fw_nh
        :parameters ()
        :precondition (and 
            (at fw)
            (time_t304)
        )
        :effect (and
            (not (at fw))
            (at nh)
            (time_t315)
            (increase (total-time) 11)
        )
    )

    ; Action 3: Meet Kenneth for 90 minutes minimum at Nob Hill.
    ; Starts at T=315, ends at T=405. This satisfies the 2:15 PM (315) to 7:45 PM (645) constraint.
    (:action meet_kenneth_90min
        :parameters ()
        :precondition (and
            (at nh)
            (time_t315) 
            (not (met_kenneth_90min))
        )
        :effect (and
            (met_kenneth_90min)
            (time_t405)
            (increase (total-time) 90)
        )
    )
)