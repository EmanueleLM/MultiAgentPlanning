(define (domain meeting_schedule)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person)
  (:predicates
    (at ?loc - location)
    (meeting_possible ?person - person ?loc - location)
    (met ?person - person)
    (time_available ?loc - location ?start - int ?end - int)
    (at_time ?time - int)
  )

  (:action travel_to_golden_gate_park
    :parameters ()
    :precondition (at bayview)
    :effect (and (not (at bayview)) (at golden_gate_park))
  )

  (:action travel_to_bayview
    :parameters ()
    :precondition (at golden_gate_park)
    :effect (and (not (at golden_gate_park)) (at bayview))
  )
  
  (:action start_meeting_with_barbara
    :parameters ()
    :precondition (and
      (at golden_gate_park)
      (at_time 822)
      (not (met barbara))
      (meeting_possible barbara golden_gate_park))
    :effect (met barbara)
  )
)