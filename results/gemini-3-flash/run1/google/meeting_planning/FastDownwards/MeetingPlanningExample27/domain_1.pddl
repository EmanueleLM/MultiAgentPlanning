(define (domain meeting_planning)
  (:requirements :typing)
  (:types person location time)

  (:predicates
    (at ?p - person ?l - location)
    (cur_time ?t - time)
    (met ?p - person)
    (successor ?t1 ?t2 - time)
    (can_travel ?from ?to - location ?t1 ?t2 - time)
    (can_meet ?p - person ?l - location ?t1 ?t2 - time)
  )

  (:action wait
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at ?p ?l) 
      (cur_time ?t1) 
      (successor ?t1 ?t2)
    )
    :effect (and 
      (not (cur_time ?t1)) 
      (cur_time ?t2)
    )
  )

  (:action travel
    :parameters (?p - person ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at ?p ?from) 
      (cur_time ?t1) 
      (can_travel ?from ?to ?t1 ?t2)
    )
    :effect (and 
      (not (at ?p ?from)) 
      (at ?p ?to) 
      (not (cur_time ?t1)) 
      (cur_time ?t2)
    )
  )

  (:action meet
    :parameters (?me - person ?friend - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at ?me ?l) 
      (cur_time ?t1) 
      (can_meet ?friend ?l ?t1 ?t2)
    )
    :effect (and 
      (met ?friend) 
      (not (cur_time ?t1)) 
      (cur_time ?t2)
    )
  )
)