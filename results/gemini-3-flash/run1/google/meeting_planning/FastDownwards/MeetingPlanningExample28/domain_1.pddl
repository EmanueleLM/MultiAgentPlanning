(define (domain meeting_planning_sf)
  (:requirements :strips :typing)
  (:types location person time)
  (:predicates
    (at_location ?l - location)
    (at_time ?t - time)
    (has_met ?p - person)
    (can_move ?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    (can_wait ?l - location ?t1 - time ?t2 - time)
    (can_meet ?p - person ?l - location ?t1 - time ?t2 - time)
  )

  (:action move
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at_location ?from) 
      (at_time ?t1) 
      (can_move ?from ?to ?t1 ?t2)
    )
    :effect (and 
      (not (at_location ?from)) 
      (at_location ?to) 
      (not (at_time ?t1)) 
      (at_time ?t2)
    )
  )

  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at_location ?l) 
      (at_time ?t1) 
      (can_wait ?l ?t1 ?t2)
    )
    :effect (and 
      (not (at_time ?t1)) 
      (at_time ?t2)
    )
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at_location ?l) 
      (at_time ?t1) 
      (can_meet ?p ?l ?t1 ?t2)
    )
    :effect (and 
      (not (at_time ?t1)) 
      (at_time ?t2) 
      (has_met ?p)
    )
  )
)