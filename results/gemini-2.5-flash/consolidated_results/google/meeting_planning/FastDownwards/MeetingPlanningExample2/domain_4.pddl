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
    (is_connected ?l1 ?l2 - location)
    (meeting_complete)
)

; Wait at HA from T_ARRIVE (9:00 AM) until T_DEPART (3:00 PM)
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

; Travel from HA to SD (T_DEPART (3:00 PM) -> T_MEET_START (3:15 PM)). Duration 15 minutes.
(:action travel_ha_to_sd
    :parameters (?t - traveler ?ha ?sd - location ?t_start ?t_end - timepoint)
    :precondition (and
        (at ?t ?ha)
        (current_time ?t_start)
        (is_connected ?ha ?sd)
    )
    :effect (and
        (not (at ?t ?ha))
        (at ?t ?sd)
        (not (current_time ?t_start))
        (current_time ?t_end)
    )
)

; Meet Jessica for 90 minutes (T_MEET_START (3:15 PM) -> T_MEET_END (4:45 PM)).
(:action meet_jessica_minimum
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