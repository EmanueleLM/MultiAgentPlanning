(define (domain meeting_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location
    time_point
    person
  )
  (:predicates
    (at ?l - location)
    (time ?t - time_point)
    (connected ?l1 ?l2 - location ?t_start ?t_end - time_point)
    (available ?p - person ?l - location ?t_start ?t_end - time_point)
    (met ?p - person)
    (before ?t_earlier ?t_later - time_point)
  )

  (:action travel
    :parameters (?from ?to - location ?t1 ?t2 - time_point)
    :precondition (and 
      (at ?from) 
      (time ?t1) 
      (connected ?from ?to ?t1 ?t2)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to) 
      (not (time ?t1)) 
      (time ?t2)
    )
  )

  (:action wait
    :parameters (?t1 ?t2 - time_point)
    :precondition (and 
      (time ?t1) 
      (before ?t1 ?t2)
    )
    :effect (and 
      (not (time ?t1)) 
      (time ?t2)
    )
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 ?t2 - time_point)
    :precondition (and 
      (at ?l) 
      (time ?t1) 
      (available ?p ?l ?t1 ?t2)
      (not (met ?p))
    )
    :effect (and 
      (met ?p) 
      (not (time ?t1)) 
      (time ?t2)
    )
  )
)