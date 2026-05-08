(define (domain meet_john_san_francisco_day)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
  )

  (:predicates
    (at ?l - location)
    (connected ?from - location ?to - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (person_at ?p - person ?l - location)
    (john_available)
    (meeting_started_john)
    (met_john)
  )

  (:action travel_russian_hill_to_golden_gate_park_before_1300
    :parameters ()
    :precondition (and
      (at russian_hill)
      (connected russian_hill golden_gate_park)
      (current_time t_0900)
    )
    :effect (and
      (not (at russian_hill))
      (at golden_gate_park)
    )
  )

  (:action wait_0900_to_1300
    :parameters ()
    :precondition (and
      (current_time t_0900)
      (next_time t_0900 t_1300)
    )
    :effect (and
      (not (current_time t_0900))
      (current_time t_1300)
    )
  )

  (:action wait_1300_to_1430
    :parameters ()
    :precondition (and
      (current_time t_1300)
      (next_time t_1300 t_1430)
    )
    :effect (and
      (not (current_time t_1300))
      (current_time t_1430)
    )
  )

  (:action wait_1430_to_1815
    :parameters ()
    :precondition (and
      (current_time t_1430)
      (next_time t_1430 t_1815)
    )
    :effect (and
      (not (current_time t_1430))
      (current_time t_1815)
    )
  )

  (:action john_becomes_available
    :parameters ()
    :precondition (and
      (current_time t_1300)
      (not (john_available))
    )
    :effect (john_available)
  )

  (:action start_meeting_john
    :parameters ()
    :precondition (and
      (current_time t_1300)
      (at golden_gate_park)
      (person_at john golden_gate_park)
      (john_available)
      (not (meeting_started_john))
      (not (met_john))
    )
    :effect (meeting_started_john)
  )

  (:action complete_meeting_john_minimum_90
    :parameters ()
    :precondition (and
      (current_time t_1430)
      (meeting_started_john)
      (at golden_gate_park)
      (person_at john golden_gate_park)
      (john_available)
      (not (met_john))
    )
    :effect (met_john)
  )

  (:action john_becomes_unavailable
    :parameters ()
    :precondition (and
      (current_time t_1815)
      (john_available)
    )
    :effect (not (john_available))
  )
)