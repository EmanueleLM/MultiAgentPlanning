(define (domain meeting_planning_example19)
  (:requirements :strips :typing)
  (:types location time)
  (:predicates
    (at ?l - location)
    (time_at ?t - time)
    (john_available ?t - time)
    (met_john)
  )

  ;; Wait until a specified later time while staying at the same location
  (:action wait_to_t1930
    :parameters ()
    :precondition (and (at golden_gate_park) (time_at t0900))
    :effect (and
      (not (time_at t0900))
      (time_at t1930)
    )
  )

  ;; Travel from Golden Gate Park to Pacific Heights taking 16 minutes:
  ;; modeled as a jump from time node t1930 to arrival node t1946.
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

  ;; Meet John starting at t1946. John's availability includes t1946,
  ;; and the meeting action advances time to t2045 (end of availability).
  ;; Meeting duration implied by these time nodes is >= 45 minutes.
  (:action meet_john_from_t1946
    :parameters ()
    :precondition (and (at pacific_heights) (time_at t1946) (john_available t1946))
    :effect (and
      met_john
      (not (time_at t1946))
      (time_at t2045)
    )
  )
)