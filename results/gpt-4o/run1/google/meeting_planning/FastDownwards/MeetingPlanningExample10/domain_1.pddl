(define (domain san_francisco_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location friend time
  )
  (:predicates
    (at ?loc - location)
    (time ?t - time)
    (can_meet_james)
    (met_james)
  )
  (:action move_to_marina_district
    :parameters ()
    :precondition (and (at golden_gate_park) (time start_time))
    :effect (and (not (at golden_gate_park)) (at marina_district) (not (time start_time)) (time james_available_start))
  )
  (:action wait_to_meet_time
    :parameters ()
    :precondition (and (at marina_district) (time james_available_start))
    :effect (can_meet_james)
  )
  (:action meet_james
    :parameters ()
    :precondition (and (at marina_district) (can_meet_james))
    :effect (and (met_james) (not (time james_available_start)) (time end_meeting_time))
  )
  (:action wait_to_departure
    :parameters ()
    :precondition (and (at marina_district) (time end_meeting_time))
    :effect (not (time end_meeting_time))
  )
)