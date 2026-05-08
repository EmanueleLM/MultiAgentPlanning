(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types
    location
    time
    person
  )
  (:predicates
    (at ?l - location)
    (time_at ?t - time)
    (met ?p - person)
  )

  (:action travel_russian_hill_to_ggp
    :parameters ()
    :precondition (and (at russian_hill) (time_at t0900))
    :effect (and 
      (not (at russian_hill)) 
      (at golden_gate_park) 
      (not (time_at t0900)) 
      (time_at t0921)
    )
  )

  (:action wait_at_ggp_for_john
    :parameters ()
    :precondition (and (at golden_gate_park) (time_at t0921))
    :effect (and 
      (not (time_at t0921)) 
      (time_at t1300)
    )
  )

  (:action meet_john_at_ggp
    :parameters ()
    :precondition (and (at golden_gate_park) (time_at t1300))
    :effect (and 
      (not (time_at t1300)) 
      (time_at t1430) 
      (met john)
    )
  )
)