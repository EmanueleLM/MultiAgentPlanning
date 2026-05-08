(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types person location time)

  (:predicates
    (at ?p - person ?l - location)
    (time_at ?t - time)
    (met ?p - person)
    (can_travel ?from - location ?to - location ?t_start - time ?t_end - time)
    (can_meet ?friend - person ?loc - location ?t_start - time ?t_end - time)
  )

  (:action travel
    :parameters (?p - person ?from - location ?to - location ?t_start - time ?t_end - time)
    :precondition (and 
      (at ?p ?from) 
      (time_at ?t_start) 
      (can_travel ?from ?to ?t_start ?t_end)
    )
    :effect (and 
      (not (at ?p ?from)) 
      (at ?p ?to) 
      (not (time_at ?t_start)) 
      (time_at ?t_end)
    )
  )

  (:action meet
    :parameters (?me - person ?friend - person ?loc - location ?t_start - time ?t_end - time)
    :precondition (and 
      (at ?me ?loc) 
      (at ?friend ?loc) 
      (time_at ?t_start) 
      (can_meet ?friend ?loc ?t_start ?t_end)
    )
    :effect (and 
      (met ?friend) 
      (not (time_at ?t_start)) 
      (time_at ?t_end)
    )
  )
)