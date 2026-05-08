(define (domain meeting_planning_example_3)
  (:requirements :strips :typing)
  (:types location time person)
  (:predicates
    (at_loc ?l - location)
    (at_time ?t - time)
    (can_travel ?from - location ?to - location ?t_start - time ?t_end - time)
    (can_meet ?p - person ?l - location ?t_start - time ?t_end - time)
    (met ?p - person)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t_start - time ?t_end - time)
    :precondition (and 
      (at_loc ?from) 
      (at_time ?t_start) 
      (can_travel ?from ?to ?t_start ?t_end)
    )
    :effect (and 
      (not (at_loc ?from)) 
      (at_loc ?to) 
      (not (at_time ?t_start)) 
      (at_time ?t_end)
    )
  )

  (:action meet
    :parameters (?p - person ?l - location ?t_start - time ?t_end - time)
    :precondition (and 
      (at_loc ?l) 
      (at_time ?t_start) 
      (can_meet ?p ?l ?t_start ?t_end)
    )
    :effect (and 
      (not (at_time ?t_start)) 
      (at_time ?t_end) 
      (met ?p)
    )
  )
)