(define (domain meeting_planning)
  (:requirements :typing :negative-preconditions)
  (:types location time person)

  (:predicates
    (at_loc ?l - location)
    (time_at ?t - time)
    (has_met ?p - person)
    (can_travel ?from - location ?to - location ?t1 - time ?t2 - time)
    (can_wait ?l - location ?t1 - time ?t2 - time)
    (available_to_meet ?p - person ?l - location ?t1 - time ?t2 - time)
  )

  (:action travel
    :parameters (?from ?to - location ?t1 ?t2 - time)
    :precondition (and 
        (at_loc ?from) 
        (time_at ?t1) 
        (can_travel ?from ?to ?t1 ?t2)
    )
    :effect (and 
        (not (at_loc ?from)) 
        (at_loc ?to) 
        (not (time_at ?t1)) 
        (time_at ?t2)
    )
  )

  (:action wait
    :parameters (?l - location ?t1 ?t2 - time)
    :precondition (and 
        (at_loc ?l) 
        (time_at ?t1) 
        (can_wait ?l ?t1 ?t2)
    )
    :effect (and 
        (not (time_at ?t1)) 
        (time_at ?t2)
    )
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 ?t2 - time)
    :precondition (and 
        (at_loc ?l) 
        (time_at ?t1) 
        (available_to_meet ?p ?l ?t1 ?t2)
    )
    :effect (and 
        (has_met ?p) 
        (not (time_at ?t1)) 
        (time_at ?t2)
    )
  )
)