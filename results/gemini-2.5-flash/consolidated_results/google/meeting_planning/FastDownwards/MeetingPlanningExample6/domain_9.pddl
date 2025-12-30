(define (domain MeetingPlanning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        location
        person
    )
    (:constants
        FW - location ; Fisherman's Wharf
        NH - location ; Nob Hill
        Kenneth - person
    )

    (:predicates
        (at ?l - location)
        (has_met_kenneth) ; Tracks if the minimum 90 minutes duration has been completed
        
        ; Time milestones (minutes elapsed since 9:00 AM)
        (time-is-T0)       ; 9:00 AM (0 min)
        (time-is-T304)     ; 14:04 PM (304 min - Departure time)
        (time-is-T315)     ; 14:15 PM (315 min - Meeting start time, earliest available)
        (time-is-T405)     ; 15:45 PM (405 min - Meeting end time, 90 mins later)
    )

    (:functions
        (total-cost) ; Tracks combined travel, waiting, and meeting time for minimization
    )

    ;; 1. Wait 304 minutes at FW (T=0 to T=304)
    (:action wait_until_departure
        :parameters ()
        :precondition (and
            (at FW)
            (time-is-T0)
        )
        :effect (and
            (not (time-is-T0))
            (time-is-T304)
            (increase (total-cost) 304) ; 304 minutes of waiting time
        )
    )

    ;; 2. Travel FW -> NH (11 minutes) (T=304 to T=315)
    (:action travel_fw_nh
        :parameters ()
        :precondition (and
            (at FW)
            (time-is-T304)
        )
        :effect (and
            (not (at FW))
            (at NH)
            (not (time-is-T304))
            (time-is-T315) ; Arrives exactly at 2:15 PM (Kenneth's start time)
            (increase (total-cost) 11) ; 11 minutes of travel cost
        )
    )

    ;; 3. Meet Kenneth for 90 minutes (T=315 to T=405)
    (:action meet_kenneth_90m
        :parameters ()
        :precondition (and
            (at NH)
            (time-is-T315)
            (not (has_met_kenneth))
        )
        :effect (and
            (has_met_kenneth)
            (not (time-is-T315))
            (time-is-T405)
            (increase (total-cost) 90) ; 90 minutes meeting duration
        )
    )
)