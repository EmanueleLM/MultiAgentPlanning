(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types person location time)
  (:predicates
    (at ?p - person ?l - location)
    (current_time ?t - time)
    (met ?p - person)
    (travel_duration ?from - location ?to - location ?t1 - time ?t2 - time)
    (meet_duration ?p - person ?t1 - time ?t2 - time)
  )

  (:action travel
    :parameters (?p - person ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at ?p ?from) 
      (current_time ?t1) 
      (travel_duration ?from ?to ?t1 ?t2)
    )
    :effect (and 
      (not (at ?p ?from)) 
      (at ?p ?to) 
      (not (current_time ?t1)) 
      (current_time ?t2)
    )
  )

  (:action meet
    :parameters (?me - person ?friend - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at ?me ?l) 
      (at ?friend ?l) 
      (current_time ?t1) 
      (meet_duration ?friend ?t1 ?t2)
    )
    :effect (and 
      (met ?friend) 
      (not (current_time ?t1)) 
      (current_time ?t2)
    )
  )
)