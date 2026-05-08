(define (domain meeting_planning_domain)
  (:requirements :strips :typing)
  (:types location time person)
  (:predicates
    (at ?loc - location)
    (current_time ?t - time)
    (has_met ?p - person)
    (can_move ?from - location ?to - location ?t1 - time ?t2 - time)
    (can_wait ?loc - location ?t1 - time ?t2 - time)
    (can_meet ?p - person ?loc - location ?t1 - time ?t2 - time)
  )

  (:action move
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and 
        (at ?from) 
        (current_time ?t1) 
        (can_move ?from ?to ?t1 ?t2)
    )
    :effect (and 
        (not (at ?from)) 
        (at ?to) 
        (not (current_time ?t1)) 
        (current_time ?t2)
    )
  )

  (:action wait
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and 
        (at ?loc) 
        (current_time ?t1) 
        (can_wait ?loc ?t1 ?t2)
    )
    :effect (and 
        (not (current_time ?t1)) 
        (current_time ?t2)
    )
  )

  (:action meet
    :parameters (?p - person ?loc - location ?t1 - time ?t2 - time)
    :precondition (and 
        (at ?loc) 
        (current_time ?t1) 
        (can_meet ?p ?loc ?t1 ?t2)
    )
    :effect (and 
        (has_met ?p)
        (not (current_time ?t1)) 
        (current_time ?t2)
    )
  )
)