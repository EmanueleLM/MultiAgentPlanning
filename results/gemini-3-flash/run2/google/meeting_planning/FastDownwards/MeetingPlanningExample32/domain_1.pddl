(define (domain meeting_planning)
  (:requirements :typing :strips)
  (:types location time person)
  (:predicates
    (at ?l - location)
    (time_at ?t - time)
    (has_met ?p - person)
    (can_travel ?from ?to - location ?t_start ?t_end - time)
    (can_meet ?p - person ?loc - location ?t_start ?t_end - time)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t_start - time ?t_end - time)
    :precondition (and 
      (at ?from) 
      (time_at ?t_start) 
      (can_travel ?from ?to ?t_start ?t_end)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to) 
      (not (time_at ?t_start)) 
      (time_at ?t_end)
    )
  )

  (:action meet
    :parameters (?p - person ?loc - location ?t_start - time ?t_end - time)
    :precondition (and 
      (at ?loc) 
      (time_at ?t_start) 
      (can_meet ?p ?loc ?t_start ?t_end)
    )
    :effect (and 
      (has_met ?p) 
      (not (time_at ?t_start)) 
      (time_at ?t_end)
    )
  )
)