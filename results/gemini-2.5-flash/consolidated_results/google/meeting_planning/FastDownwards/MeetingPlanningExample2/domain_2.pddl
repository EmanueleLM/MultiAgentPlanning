(define (domain MeetingPlanningExample2_STRIPS)
(:requirements :strips :typing :negative-preconditions)
(:types
    location
    traveler
    timepoint
)

(:predicates
    (at ?t - traveler ?l - location)
    (at_time ?tp - timepoint)
    (is_connected ?l1 ?l2 - location)
    (meeting_complete)
)

; Wait at HA from 9:00 AM (T540) until 3:00 PM (T900)
(:action wait_for_departure
    :parameters (?t - traveler ?l_ha - location ?t540 ?t900 - timepoint)
    :precondition (and 
        (at ?t ?l_ha)
        (at_time ?t540)
    )
    :effect (and 
        (not (at_time ?t540))
        (at_time ?t900)
    )
)

; Travel from HA to SD (15 minutes duration implied by time points T900 -> T915)
(:action travel_ha_to_sd
    :parameters (?t - traveler ?ha ?sd - location ?t900 ?t915 - timepoint)
    :precondition (and
        (at ?t ?ha)
        (at_time ?t900)
        (is_connected ?ha ?sd)
    )
    :effect (and
        (not (at ?t ?ha))
        (at ?t ?sd)
        (not (at_time ?t900))
        (at_time ?t915)
    )
)

; Meet Jessica for 90 minutes (T915 -> T1005). Meeting ends at 4:45 PM.
(:action meet_jessica_90_minutes
    :parameters (?t - traveler ?sd - location ?t915 ?t1005 - timepoint)
    :precondition (and
        (at ?t ?sd)
        (at_time ?t915)
    )
    :effect (and
        (meeting_complete)
        (not (at_time ?t915))
        (at_time ?t1005) 
    )
)
)