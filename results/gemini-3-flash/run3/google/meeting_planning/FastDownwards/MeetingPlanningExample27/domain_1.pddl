(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types person location time)
  (:predicates
    (at ?p - person ?l - location)
    (current_time ?t - time)
    (met ?p - person)
    (can_travel ?from - location ?to - location ?t_start - time ?t_end - time)
    (can_wait ?l - location ?t_start - time ?t_end - time)
    (available ?p - person ?l - location ?t_start - time ?t_end - time)
  )

  (:action travel
    :parameters (?p - person ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at ?p ?from) 
      (current_time ?t1) 
      (can_travel ?from ?to ?t1 ?t2)
    )
    :effect (and 
      (not (at ?p ?from)) 
      (at ?p ?to) 
      (not (current_time ?t1)) 
      (current_time ?t2)
    )
  )

  (:action wait
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at ?p ?l) 
      (current_time ?t1) 
      (can_wait ?l ?t1 ?t2)
    )
    :effect (and 
      (not (current_time ?t1)) 
      (current_time ?t2)
    )
  )

  (:action meet
    :parameters (?me - person ?friend - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at ?me ?l) 
      (current_time ?t1) 
      (available ?friend ?l ?t1 ?t2)
    )
    :effect (and 
      (met ?friend) 
      (not (current_time ?t1)) 
      (current_time ?t2)
    )
  )
)