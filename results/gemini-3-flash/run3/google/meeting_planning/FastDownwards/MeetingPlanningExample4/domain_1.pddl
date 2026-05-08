(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location person time)

  (:predicates
    (at ?l - location)
    (time_at ?t - time)
    (has_met ?p - person)
    (move_available ?from - location ?to - location ?t1 - time ?t2 - time)
    (wait_available ?l - location ?t1 - time ?t2 - time)
    (meet_available ?p - person ?l - location ?t1 - time ?t2 - time)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and 
        (at ?from) 
        (time_at ?t1) 
        (move_available ?from ?to ?t1 ?t2)
    )
    :effect (and 
        (not (at ?from)) 
        (at ?to) 
        (not (time_at ?t1)) 
        (time_at ?t2)
    )
  )

  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and 
        (at ?l) 
        (time_at ?t1) 
        (wait_available ?l ?t1 ?t2)
    )
    :effect (and 
        (not (time_at ?t1)) 
        (time_at ?t2)
    )
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and 
        (at ?l) 
        (time_at ?t1) 
        (meet_available ?p ?l ?t1 ?t2)
    )
    :effect (and 
        (not (time_at ?t1)) 
        (time_at ?t2) 
        (has_met ?p)
    )
  )
)