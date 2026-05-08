(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time person)
  (:predicates 
    (at_me ?l - location ?t - time)
    (is_at ?p - person ?l - location ?t - time)
    (can_travel ?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    (next ?t1 - time ?t2 - time)
    (duration_met ?t1 - time ?t2 - time)
    (met ?p - person)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at_me ?from ?t1) 
      (can_travel ?from ?to ?t1 ?t2)
    )
    :effect (and 
      (not (at_me ?from ?t1)) 
      (at_me ?to ?t2)
    )
  )

  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and 
      (at_me ?l ?t1) 
      (next ?t1 ?t2)
    )
    :effect (and 
      (not (at_me ?l ?t1)) 
      (at_me ?l ?t2)
    )
  )

  (:action meet
    :parameters (?p - person ?l - location ?t_start - time ?t_end - time)
    :precondition (and 
      (at_me ?l ?t_start) 
      (is_at ?p ?l ?t_start) 
      (is_at ?p ?l ?t_end) 
      (duration_met ?t_start ?t_end)
    )
    :effect (and 
      (not (at_me ?l ?t_start)) 
      (at_me ?l ?t_end) 
      (met ?p)
    )
  )
)