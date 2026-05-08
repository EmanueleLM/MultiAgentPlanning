(define (domain MeetingPlanningExample2_STRIPS)
(:requirements :strips :typing :negative-preconditions)
(:types
    location
    traveler
    timepoint
)

(:predicates
    (at ?t - traveler ?l - location)
    (current_time ?tp - timepoint)
    (meeting_complete)
    (is_ha ?l - location)
    (is_sd ?l - location)
    
    ; Specialized duration predicates to enforce stage duration consistency
    (duration_wait ?t1 - timepoint ?t2 - timepoint)
    (duration_travel ?t1 - timepoint ?t2 - timepoint)
    (duration_meeting ?t1 - timepoint ?t2 - timepoint)
)

; Stage 1: Wait at HA from 9:00 AM (T0900) until 3:00 PM (T1500). (360 min wait)
(:action wait_for_departure
    :parameters (?t - traveler ?l_ha - location ?t_start ?t_end - timepoint)
    :precondition (and 
        (at ?t ?l_ha)
        (is_ha ?l_ha)
        (current_time ?t_start)
        (duration_wait ?t_start ?t_end) ; T0900 must transition to T1500
    )
    :effect (and 
        (not (current_time ?t_start))
        (current_time ?t_end)
    )
)

; Stage 2: Travel from HA to SD (3:00 PM (T1500) -> 3:15 PM (T1515)). (15 min travel)
(:action travel_ha_to_sd
    :parameters (?t - traveler ?ha ?sd - location ?t_start ?t_end - timepoint)
    :precondition (and
        (at ?t ?ha)
        (is_ha ?ha)
        (is_sd ?sd)
        (current_time ?t_start)
        (duration_travel ?t_start ?t_end) ; T1500 must transition to T1515
    )
    :effect (and
        (not (at ?t ?ha))
        (at ?t ?sd)
        (not (current_time ?t_start))
        (current_time ?t_end)
    )
)

; Stage 3: Meet Jessica for 90 minutes (3:15 PM (T1515) -> 4:45 PM (T1645)).
(:action meet_jessica
    :parameters (?t - traveler ?sd - location ?t_start ?t_end - timepoint)
    :precondition (and
        (at ?t ?sd)
        (is_sd ?sd)
        (current_time ?t_start)
        (duration_meeting ?t_start ?t_end) ; T1515 must transition to T1645
    )
    :effect (and
        (meeting_complete)
        (not (current_time ?t_start))
        (current_time ?t_end) 
    )
)