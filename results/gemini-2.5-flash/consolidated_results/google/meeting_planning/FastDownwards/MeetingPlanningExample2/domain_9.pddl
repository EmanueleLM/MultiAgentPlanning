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
    
    (duration_wait ?t1 - timepoint ?t2 - timepoint)
    (duration_travel ?t1 - timepoint ?t2 - timepoint)
    (duration_meeting ?t1 - timepoint ?t2 - timepoint)
)

(:action wait_for_departure
    :parameters (?t - traveler ?l_ha - location ?t_start ?t_end - timepoint)
    :precondition (and 
        (at ?t ?l_ha)
        (is_ha ?l_ha)
        (current_time ?t_start)
        (duration_wait ?t_start ?t_end)
    )
    :effect (and 
        (not (current_time ?t_start))
        (current_time ?t_end)
    )
)

(:action travel_ha_to_sd
    :parameters (?t - traveler ?ha ?sd - location ?t_start ?t_end - timepoint)
    :precondition (and
        (at ?t ?ha)
        (is_ha ?ha)
        (is_sd ?sd)
        (current_time ?t_start)
        (duration_travel ?t_start ?t_end)
    )
    :effect (and
        (not (at ?t ?ha))
        (at ?t ?sd)
        (not (current_time ?t_start))
        (current_time ?t_end)
    )
)

(:action meet_jessica
    :parameters (?t - traveler ?sd - location ?t_start ?t_end - timepoint)
    :precondition (and
        (at ?t ?sd)
        (is_sd ?sd)
        (current_time ?t_start)
        (duration_meeting ?t_start ?t_end)
    )
    :effect (and
        (meeting_complete)
        (not (current_time ?t_start))
        (current_time ?t_end) 
    )
)
)