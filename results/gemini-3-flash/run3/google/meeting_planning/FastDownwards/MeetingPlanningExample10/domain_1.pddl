(define (domain meeting_planning_domain)
  (:requirements :strips :typing)
  (:types location person time_step)
  (:predicates
    (at ?p - person ?l - location)
    (cur_time ?t - time_step)
    (met ?p - person)
    (presence ?p - person ?l - location ?t - time_step)
    (can_travel ?l1 ?l2 - location ?t1 ?t2 - time_step)
    (can_wait ?l - location ?t1 ?t2 - time_step)
    (can_meet ?p - person ?l - location ?t1 ?t2 - time_step)
  )

  (:action move
    :parameters (?p - person ?from ?to - location ?t1 ?t2 - time_step)
    :precondition (and 
        (at ?p ?from) 
        (cur_time ?t1) 
        (can_travel ?from ?to ?t1 ?t2)
    )
    :effect (and 
        (not (at ?p ?from)) 
        (at ?p ?to) 
        (not (cur_time ?t1)) 
        (cur_time ?t2)
    )
  )

  (:action wait
    :parameters (?p - person ?l - location ?t1 ?t2 - time_step)
    :precondition (and 
        (at ?p ?l) 
        (cur_time ?t1) 
        (can_wait ?l ?t1 ?t2)
    )
    :effect (and 
        (not (cur_time ?t1)) 
        (cur_time ?t2)
    )
  )

  (:action meet
    :parameters (?me ?p - person ?l - location ?t1 ?t2 - time_step)
    :precondition (and 
        (at ?me ?l) 
        (cur_time ?t1) 
        (presence ?p ?l ?t1) 
        (presence ?p ?l ?t2) 
        (can_meet ?p ?l ?t1 ?t2)
    )
    :effect (and 
        (met ?p) 
        (not (cur_time ?t1)) 
        (cur_time ?t2)
    )
  )
)