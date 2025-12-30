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
)

; Stage 1: Wait at HA from 9:00 AM (T900) until 3:00 PM (T1500)
(:action wait_for_departure
    :parameters (?t - traveler ?l_ha - location ?t_start ?t_end - timepoint)
    :precondition (and 
        (at ?t ?l_ha)
        (current_time ?t_start)
    )
    :effect (and 
        (not (current_time ?t_start))
        (current_time ?t_end)
    )
)

; Stage 2: Travel from HA to SD (3:00 PM -> 3:15 PM). Duration 15 minutes.
(:action travel_ha_to_sd
    :parameters (?t - traveler ?ha ?sd - location ?t_start ?t_end - timepoint)
    :precondition (and
        (at ?t ?ha)
        (current_time ?t_start)
    )
    :effect (and
        (not (at ?t ?ha))
        (at ?t ?sd)
        (not (current_time ?t_start))
        (current_time ?t_end)
    )
)

; Stage 3: Meet Jessica for 90 minutes (3:15 PM -> 4:45 PM). This must occur at SD.
(:action meet_jessica
    :parameters (?t - traveler ?sd - location ?t_start ?t_end - timepoint)
    :precondition (and
        (at ?t ?sd)
        (current_time ?t_start)
    )
    :effect (and
        (meeting_complete)
        (not (current_time ?t_start))
        (current_time ?t_end) 
    )
)