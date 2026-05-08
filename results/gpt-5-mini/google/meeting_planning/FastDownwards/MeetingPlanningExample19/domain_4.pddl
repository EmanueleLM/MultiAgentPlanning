(define (domain meeting_planning_example19)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)

  (:constants
    golden_gate_park pacific_heights - location
    t0900 t1930 t1946 t2045 - time
  )

  (:predicates
    (at ?l - location)
    (time_at ?t - time)
    (john_available ?t - time)
    (met_john)
  )

  ;; Wait from morning until the evening departure opportunity (instance-specific)
  (:action wait_to_t1930
    :parameters ()
    :precondition (and (at golden_gate_park) (time_at t0900))
    :effect (and
      (not (time_at t0900))
      (time_at t1930)
    )
  )

  ;; Travel from Golden Gate Park to Pacific Heights: duration encoded by jumping time point t1930 -> t1946 (16 minutes)
  (:action travel_ggp_to_ph_from_t1930
    :parameters ()
    :precondition (and (at golden_gate_park) (time_at t1930) (not (at pacific_heights)))
    :effect (and
      (not (at golden_gate_park))
      (at pacific_heights)
      (not (time_at t1930))
      (time_at t1946)
    )
  )

  ;; Meet John starting at t1946 and finishing at t2045 (this encodes a meeting of >=45 minutes within John's availability window)
  (:action meet_john_from_t1946
    :parameters ()
    :precondition (and (at pacific_heights) (time_at t1946) (john_available t1946) (john_available t2045))
    :effect (and
      (met_john)
      (not (time_at t1946))
      (time_at t2045)
    )
  )
)