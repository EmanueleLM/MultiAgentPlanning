(define (domain meeting_planning_example19)
  (:requirements :typing)
  (:types location time)
  (:predicates
    (at ?l - location)
    (time_at ?t - time)
    (john_available ?t - time)
    (met_john)
  )

  (:action wait_to_t1930
    :parameters ()
    :precondition (and (at golden_gate_park) (time_at t0900))
    :effect (and
      (not (time_at t0900))
      (time_at t1930)
    )
  )

  (:action travel_ggp_to_ph_from_t1930
    :parameters ()
    :precondition (and (at golden_gate_park) (time_at t1930))
    :effect (and
      (not (at golden_gate_park))
      (at pacific_heights)
      (not (time_at t1930))
      (time_at t1946)
    )
  )

  (:action meet_john_from_t1946
    :parameters ()
    :precondition (and (at pacific_heights) (time_at t1946) (john_available t1946))
    :effect (and
      (met_john)
      (not (time_at t1946))
      (time_at t2045)
    )
  )
)