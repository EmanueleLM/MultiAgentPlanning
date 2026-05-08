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
    (can_travel ?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    (can_wait ?l - location ?t1 - time ?t2 - time)
    (can_meet ?p - person ?l - location ?t1 - time ?t2 - time)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at ?from) 
      (time_at ?t1) 
      (can_travel ?from ?to ?t1 ?t2)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to) 
      (not (time_at ?t1)) 
      (time_at ?t2)
    )
  )

  (:action wait
    :parameters (?loc - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at ?loc) 
      (time_at ?t1) 
      (can_wait ?loc ?t1 ?t2)
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
      (can_meet ?p ?l ?t1 ?t2)
    )
    :effect (and 
      (not (time_at ?t1)) 
      (time_at ?t2) 
      (met ?p)
    )
  )
)