(define (domain meeting_planning_example_11)
  (:requirements :strips :typing)
  (:types location time_point)
  (:predicates
    (at_location ?l - location)
    (time_at ?t - time_point)
    (next ?t1 ?t2 - time_point)
    (met_carol)
  )

  (:action travel_nob_hill_to_sunset
    :parameters ()
    :precondition (and (at_location nob_hill) (time_at t0900))
    :effect (and 
      (not (at_location nob_hill)) 
      (at_location sunset_district) 
      (not (time_at t0900)) 
      (time_at t0925)
    )
  )

  (:action wait
    :parameters (?t1 - time_point ?t2 - time_point)
    :precondition (and (time_at ?t1) (next ?t1 ?t2))
    :effect (and 
      (not (time_at ?t1)) 
      (time_at ?t2)
    )
  )

  (:action meet_carol
    :parameters ()
    :precondition (and 
      (at_location sunset_district) 
      (time_at t1400)
    )
    :effect (and 
      (not (time_at t1400)) 
      (time_at t1515) 
      (met_carol)
    )
  )
)