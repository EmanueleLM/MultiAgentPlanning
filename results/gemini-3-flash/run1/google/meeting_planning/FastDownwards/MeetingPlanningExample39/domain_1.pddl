(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location timepoint person)

  (:predicates
    (at ?l - location)
    (time ?t - timepoint)
    (met ?p - person)
    (can_travel ?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    (can_wait ?l - location ?t1 - timepoint ?t2 - timepoint)
    (can_meet ?p - person ?l - location ?t1 - timepoint ?t2 - timepoint)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and 
      (at ?from) 
      (time ?t1) 
      (can_travel ?from ?to ?t1 ?t2)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to) 
      (not (time ?t1)) 
      (time ?t2)
    )
  )

  (:action wait
    :parameters (?l - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and 
      (at ?l) 
      (time ?t1) 
      (can_wait ?l ?t1 ?t2)
    )
    :effect (and 
      (not (time ?t1)) 
      (time ?t2)
    )
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and 
      (at ?l) 
      (time ?t1) 
      (can_meet ?p ?l ?t1 ?t2)
    )
    :effect (and 
      (not (time ?t1)) 
      (time ?t2) 
      (met ?p)
    )
  )
)