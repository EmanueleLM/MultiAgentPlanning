(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types 
    location timepoint person - object
  )

  (:predicates
    (at ?l - location)
    (time_at ?t - timepoint)
    (next ?t1 ?t2 - timepoint)
    (travel_possible ?l1 ?l2 - location ?t1 ?t2 - timepoint)
    (meeting_possible ?p - person ?l - location ?t1 ?t2 - timepoint)
    (met ?p - person)
  )

  (:action travel
    :parameters (?l1 ?l2 - location ?t1 ?t2 - timepoint)
    :precondition (and 
      (at ?l1) 
      (time_at ?t1) 
      (travel_possible ?l1 ?l2 ?t1 ?t2)
    )
    :effect (and 
      (not (at ?l1)) 
      (at ?l2) 
      (not (time_at ?t1)) 
      (time_at ?t2)
    )
  )

  (:action wait
    :parameters (?l - location ?t1 ?t2 - timepoint)
    :precondition (and 
      (at ?l) 
      (time_at ?t1) 
      (next ?t1 ?t2)
    )
    :effect (and 
      (not (time_at ?t1)) 
      (time_at ?t2)
    )
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 ?t2 - timepoint)
    :precondition (and 
      (at ?l) 
      (time_at ?t1) 
      (meeting_possible ?p ?l ?t1 ?t2)
    )
    :effect (and 
      (not (time_at ?t1)) 
      (time_at ?t2) 
      (met ?p)
    )
  )
)