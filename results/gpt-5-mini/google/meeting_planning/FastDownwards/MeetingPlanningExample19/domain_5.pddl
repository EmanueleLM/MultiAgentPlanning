(define (domain meeting_planning_example19)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)

  (:constants
    golden_gate_park pacific_heights - location
    t0900 t1944 t2000 t2045 - time
  )

  (:predicates
    (at ?l - location)
    (time_at ?t - time)
    (john_available ?t - time)
    (met_john)
  )

  ;; Wait from the morning arrival (09:00) until the chosen departure time (19:44).
  ;; This models waiting at Golden Gate Park until it's time to leave to reach John in time.
  (:action wait_to_t1944
    :parameters ()
    :precondition (and (at golden_gate_park) (time_at t0900))
    :effect (and
      (not (time_at t0900))
      (time_at t1944)
    )
  )

  ;; Travel from Golden Gate Park to Pacific Heights leaving at 19:44 and arriving at 20:00 (16 minutes).
  (:action travel_ggp_to_ph_from_t1944
    :parameters ()
    :precondition (and (at golden_gate_park) (time_at t1944))
    :effect (and
      (not (at golden_gate_park))
      (at pacific_heights)
      (not (time_at t1944))
      (time_at t2000)
    )
  )

  ;; Meet John starting at 20:00 and finishing at 20:45 (45 minutes).
  ;; Require John's availability at the discrete start and end time points used by the model.
  (:action meet_john_from_t2000
    :parameters ()
    :precondition (and (at pacific_heights) (time_at t2000) (john_available t2000) (john_available t2045))
    :effect (and
      (met_john)
      (not (time_at t2000))
      (time_at t2045)
    )
  )
)