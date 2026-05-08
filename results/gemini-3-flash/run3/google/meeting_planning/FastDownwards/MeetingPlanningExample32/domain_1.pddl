(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time person)
  (:predicates 
    (at_location ?l - location)
    (current_time ?t - time)
    (person_at ?p - person ?l - location)
    (has_met ?p - person)
    (travel_possible ?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    (meeting_possible ?p - person ?t1 - time ?t2 - time)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at_location ?from) 
      (current_time ?t1) 
      (travel_possible ?from ?to ?t1 ?t2)
    )
    :effect (and 
      (not (at_location ?from)) 
      (at_location ?to) 
      (not (current_time ?t1)) 
      (current_time ?t2)
    )
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at_location ?l) 
      (current_time ?t1) 
      (person_at ?p ?l) 
      (meeting_possible ?p ?t1 ?t2)
    )
    :effect (and 
      (has_met ?p) 
      (not (current_time ?t1)) 
      (current_time ?t2)
    )
  )
)