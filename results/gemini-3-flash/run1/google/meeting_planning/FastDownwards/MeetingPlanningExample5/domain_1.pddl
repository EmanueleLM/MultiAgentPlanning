(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types person location time)

  (:predicates
    (at ?p - person ?l - location)
    (at_time ?t - time)
    (next ?t1 - time ?t2 - time)
    (met ?p - person)
    (travel_possible ?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    (meeting_possible ?p - person ?l - location ?t1 - time ?t2 - time)
  )

  (:action travel
    :parameters (?p - person ?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at ?p ?l1) 
      (at_time ?t1) 
      (next ?t1 ?t2) 
      (travel_possible ?l1 ?l2 ?t1 ?t2)
    )
    :effect (and 
      (not (at ?p ?l1)) 
      (at ?p ?l2) 
      (not (at_time ?t1)) 
      (at_time ?t2)
    )
  )

  (:action wait
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at ?p ?l) 
      (at_time ?t1) 
      (next ?t1 ?t2)
    )
    :effect (and 
      (not (at_time ?t1)) 
      (at_time ?t2)
    )
  )

  (:action meet
    :parameters (?p - person ?friend - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at ?p ?l) 
      (at_time ?t1) 
      (next ?t1 ?t2) 
      (meeting_possible ?friend ?l ?t1 ?t2)
    )
    :effect (and 
      (met ?friend) 
      (not (at_time ?t1)) 
      (at_time ?t2)
    )
  )
)