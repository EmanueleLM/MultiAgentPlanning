(define (domain meeting_planning_domain)
  (:requirements :strips :typing)
  (:types location time_point person)
  (:predicates
    (at_location ?l - location)
    (time_at ?t - time_point)
    (met ?p - person)
    (can_travel ?l1 - location ?l2 - location ?t1 - time_point ?t2 - time_point)
    (can_wait ?t1 - time_point ?t2 - time_point)
    (can_meet ?p - person ?l - location ?t1 - time_point ?t2 - time_point)
  )

  (:action travel
    :parameters (?l1 - location ?l2 - location ?t1 - time_point ?t2 - time_point)
    :precondition (and 
      (at_location ?l1) 
      (time_at ?t1) 
      (can_travel ?l1 ?l2 ?t1 ?t2)
    )
    :effect (and 
      (not (at_location ?l1)) 
      (at_location ?l2) 
      (not (time_at ?t1)) 
      (time_at ?t2)
    )
  )

  (:action wait
    :parameters (?l - location ?t1 - time_point ?t2 - time_point)
    :precondition (and 
      (at_location ?l) 
      (time_at ?t1) 
      (can_wait ?t1 ?t2)
    )
    :effect (and 
      (not (time_at ?t1)) 
      (time_at ?t2)
    )
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 - time_point ?t2 - time_point)
    :precondition (and 
      (at_location ?l) 
      (time_at ?t1) 
      (can_meet ?p ?l ?t1 ?t2)
    )
    :effect (and 
      (met ?p) 
      (not (time_at ?t1)) 
      (time_at ?t2)
    )
  )
)