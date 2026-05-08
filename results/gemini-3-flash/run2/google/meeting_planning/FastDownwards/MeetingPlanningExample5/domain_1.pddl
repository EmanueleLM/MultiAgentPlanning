(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location person time)
  (:predicates
    (at_location ?l - location)
    (current_time ?t - time)
    (met ?p - person)
    (can_travel ?l1 ?l2 - location ?t1 ?t2 - time)
    (can_wait ?l - location ?t1 ?t2 - time)
    (friend_at ?p - person ?l - location ?t1 ?t2 - time)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at_location ?from) 
      (current_time ?t1) 
      (can_travel ?from ?to ?t1 ?t2)
    )
    :effect (and 
      (not (at_location ?from)) 
      (at_location ?to) 
      (not (current_time ?t1)) 
      (current_time ?t2)
    )
  )

  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at_location ?l) 
      (current_time ?t1) 
      (can_wait ?l ?t1 ?t2)
    )
    :effect (and 
      (not (current_time ?t1)) 
      (current_time ?t2)
    )
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at_location ?l) 
      (current_time ?t1) 
      (friend_at ?p ?l ?t1 ?t2)
    )
    :effect (and 
      (met ?p) 
      (not (current_time ?t1)) 
      (current_time ?t2)
    )
  )
)