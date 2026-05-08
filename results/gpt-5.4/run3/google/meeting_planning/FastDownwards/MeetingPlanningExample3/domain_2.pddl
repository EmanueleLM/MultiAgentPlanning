(define (domain san_francisco_barbara_day)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    timepoint
  )

  (:constants
    bayview golden_gate_park - location
    t0900 t0922 t1000 t1130 - timepoint
  )

  (:predicates
    (at ?l - location)
    (connected ?from - location ?to - location)
    (current_time ?t - timepoint)
    (barbara_available_at ?t - timepoint)
    (travel_bayview_to_golden_gate_park_possible_at ?t1 - timepoint ?t2 - timepoint)
    (met_barbara_required)
  )

  (:action travel_bayview_to_golden_gate_park
    :parameters ()
    :precondition (and
      (at bayview)
      (current_time t0900)
      (connected bayview golden_gate_park)
      (travel_bayview_to_golden_gate_park_possible_at t0900 t0922)
    )
    :effect (and
      (not (at bayview))
      (at golden_gate_park)
      (not (current_time t0900))
      (current_time t0922)
    )
  )

  (:action wait_at_golden_gate_park_from_t0922_to_t1000
    :parameters ()
    :precondition (and
      (at golden_gate_park)
      (current_time t0922)
    )
    :effect (and
      (not (current_time t0922))
      (current_time t1000)
    )
  )

  (:action wait_at_bayview_from_t0900_to_t1000
    :parameters ()
    :precondition (and
      (at bayview)
      (current_time t0900)
    )
    :effect (and
      (not (current_time t0900))
      (current_time t1000)
    )
  )

  (:action wait_at_bayview_from_t1000_to_t1130
    :parameters ()
    :precondition (and
      (at bayview)
      (current_time t1000)
    )
    :effect (and
      (not (current_time t1000))
      (current_time t1130)
    )
  )

  (:action wait_at_golden_gate_park_from_t1000_to_t1130
    :parameters ()
    :precondition (and
      (at golden_gate_park)
      (current_time t1000)
    )
    :effect (and
      (not (current_time t1000))
      (current_time t1130)
    )
  )

  (:action meet_barbara_for_required_duration_from_t0922
    :parameters ()
    :precondition (and
      (at golden_gate_park)
      (current_time t0922)
      (barbara_available_at t0922)
      (not (met_barbara_required))
    )
    :effect (and
      (met_barbara_required)
      (not (current_time t0922))
      (current_time t1130)
    )
  )

  (:action meet_barbara_for_required_duration_from_t1000
    :parameters ()
    :precondition (and
      (at golden_gate_park)
      (current_time t1000)
      (barbara_available_at t1000)
      (not (met_barbara_required))
    )
    :effect (and
      (met_barbara_required)
      (not (current_time t1000))
      (current_time t1130)
    )
  )
)