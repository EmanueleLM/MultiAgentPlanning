(define (domain san_francisco_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location friend time
  )
  (:predicates
    (at ?loc - location)
    (current_time ?t - time)
    (can_meet_james)
    (met_james)
  )
  (:action move_to_marina_district
    :parameters ()
    :precondition (and (at golden_gate_park) (current_time start_time))
    :effect (and (not (at golden_gate_park)) (at marina_district) (not (current_time start_time)) (current_time james_available_start))
  )
  (:action wait_to_meet_time
    :parameters ()
    :precondition (and (at marina_district) (current_time james_available_start))
    :effect (can_meet_james)
  )
  (:action meet_james
    :parameters ()
    :precondition (and (at marina_district) (can_meet_james))
    :effect (and (met_james) (not (current_time james_available_start)) (current_time end_meeting_time))
  )
  (:action wait_to_departure
    :parameters ()
    :precondition (and (at marina_district) (current_time end_meeting_time))
    :effect (not (current_time end_meeting_time))
  )
)