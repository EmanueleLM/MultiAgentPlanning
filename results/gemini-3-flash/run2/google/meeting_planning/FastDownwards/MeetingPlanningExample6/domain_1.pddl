(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types person location time_point)

  (:predicates
    (at_person ?p - person ?l - location)
    (time_at ?t - time_point)
    (met ?p - person)
    (can_move ?t1 - time_point ?t2 - time_point ?l1 - location ?l2 - location)
    (can_wait ?t1 - time_point ?t2 - time_point)
    (can_meet ?t1 - time_point ?t2 - time_point ?p - person ?l - location)
  )

  (:action move
    :parameters (?p - person ?l1 - location ?l2 - location ?t1 - time_point ?t2 - time_point)
    :precondition (and 
      (at_person ?p ?l1) 
      (time_at ?t1) 
      (can_move ?t1 ?t2 ?l1 ?l2)
    )
    :effect (and 
      (not (at_person ?p ?l1)) 
      (at_person ?p ?l2) 
      (not (time_at ?t1)) 
      (time_at ?t2)
    )
  )

  (:action wait
    :parameters (?p - person ?l - location ?t1 - time_point ?t2 - time_point)
    :precondition (and 
      (at_person ?p ?l) 
      (time_at ?t1) 
      (can_wait ?t1 ?t2)
    )
    :effect (and 
      (not (time_at ?t1)) 
      (time_at ?t2)
    )
  )

  (:action meet
    :parameters (?me - person ?friend - person ?l - location ?t1 - time_point ?t2 - time_point)
    :precondition (and 
      (at_person ?me ?l) 
      (time_at ?t1) 
      (can_meet ?t1 ?t2 ?friend ?l)
    )
    :effect (and 
      (not (time_at ?t1)) 
      (time_at ?t2) 
      (met ?friend)
    )
  )
)